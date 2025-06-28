import 'package:equatable/equatable.dart';
import 'package:open_meteo_api/open_meteo_api.dart' hide Weather;
import 'package:open_meteo_api/open_meteo_api.dart' as open_meteo_api;

enum TemperatureUnits { fahrenheit, celsius }

extension TemperatureUnitsX on TemperatureUnits {
  bool get isFahrenheit => this == TemperatureUnits.fahrenheit;
  bool get isCelsius => this == TemperatureUnits.celsius;
}

/// {@template weather}
/// Weather model.
/// {@endtemplate}
class Weather extends Equatable {
  /// {@macro weather}
  const Weather({
    required this.condition,
    required this.lastUpdated,
    required this.location,
    required this.temperature,
  });

  /// Creates a [Weather] from an [open_meteo_api.Weather].
  factory Weather.fromRepository(open_meteo_api.Weather weather) {
    return Weather(
      condition: weather.condition,
      lastUpdated: DateTime.now(),
      location: '',
      temperature: weather.temperature,
    );
  }

  /// Creates an empty [Weather] with default values.
  static const empty = Weather(
    condition: WeatherCondition.unknown,
    lastUpdated: null,
    location: '--',
    temperature: 0,
  );

  /// Weather condition.
  final WeatherCondition condition;

  /// Last updated time.
  final DateTime? lastUpdated;

  /// Location name.
  final String location;

  /// Temperature value.
  final double temperature;

  @override
  List<Object?> get props => [condition, lastUpdated, location, temperature];

  /// Returns a copy of this [Weather] with the given fields replaced.
  Weather copyWith({
    WeatherCondition? condition,
    DateTime? lastUpdated,
    String? location,
    double? temperature,
  }) {
    return Weather(
      condition: condition ?? this.condition,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      location: location ?? this.location,
      temperature: temperature ?? this.temperature,
    );
  }
}
