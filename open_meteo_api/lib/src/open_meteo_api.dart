import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:open_meteo_api/src/models/models.dart';

/// Exception thrown when locationSearch fails.
class LocationRequestFailure implements Exception {}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure implements Exception {}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure implements Exception {}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure implements Exception {}

/// {@template open_meteo_api_client}
/// Dart API Client which wraps the [Open Meteo API](https://open-meteo.com).
/// {@endtemplate}
class OpenMeteoApiClient {
  /// {@macro open_meteo_api_client}
  OpenMeteoApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  static const String _baseUrlWeather = 'api.open-meteo.com';
  static const String _baseUrlGeocoding = 'geocoding-api.open-meteo.com';

  final http.Client _httpClient;

  /// Finds a [Location] `/v1/search/?name=(query)`.
  Future<Location> locationSearch(String query) async {
    final request = Uri.https(_baseUrlGeocoding, '/v1/search', {
      'name': query,
      'count': '1',
    });

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw LocationRequestFailure();
    }

    final locationJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (!locationJson.containsKey('results')) throw LocationNotFoundFailure();

    final results = locationJson['results'] as List;

    if (results.isEmpty) throw LocationNotFoundFailure();

    return Location.fromJson(results.first as Map<String, dynamic>);
  }

  /// Fetches [Weather] for a given [latitude] and [longitude].
  Future<Weather> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final request = Uri.https(_baseUrlWeather, '/v1/forecast', {
      'latitude': '$latitude',
      'longitude': '$longitude',
      'current_weather': 'true',
    });

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) {
      throw WeatherRequestFailure();
    }

    final bodyJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('current_weather')) {
      throw WeatherNotFoundFailure();
    }

    final weatherJson = bodyJson['current_weather'] as Map<String, dynamic>;

    return Weather.fromJson(weatherJson);
  }
}
