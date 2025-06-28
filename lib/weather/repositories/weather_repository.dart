import 'dart:async';

import 'package:open_meteo_api/open_meteo_api.dart' hide Weather;
import 'package:weather/weather/models/models.dart';

/// {@template weather_repository}
/// Repository which manages the weather domain.
/// {@endtemplate}
class WeatherRepository {
  /// {@macro weather_repository}
  WeatherRepository({OpenMeteoApiClient? weatherApiClient})
    : _weatherApiClient = weatherApiClient ?? OpenMeteoApiClient();

  final OpenMeteoApiClient _weatherApiClient;

  /// Fetches [Weather] for a given [city].
  Future<Weather> getWeather(String city) async {
    final location = await _weatherApiClient.locationSearch(city);
    final weather = await _weatherApiClient.getWeather(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    return Weather.fromRepository(weather);
  }
}
