part of 'weather_bloc.dart';

/// {@template weather_status}
/// Enum for weather status.
/// {@endtemplate}
enum WeatherStatus {
  /// Initial status, no weather fetched.
  initial,

  /// Weather is being fetched.
  loading,

  /// Weather fetched successfully.
  success,

  /// Failed to fetch weather.
  failure,
}

extension WeatherStatusX on WeatherStatus {
  /// Returns true if status is initial.
  bool get isInitial => this == WeatherStatus.initial;

  /// Returns true if status is loading.
  bool get isLoading => this == WeatherStatus.loading;

  /// Returns true if status is success.
  bool get isSuccess => this == WeatherStatus.success;

  /// Returns true if status is failure.
  bool get isFailure => this == WeatherStatus.failure;
}

/// {@template weather_state}
/// State for WeatherBloc.
/// {@endtemplate}
final class WeatherState extends Equatable {
  /// {@macro weather_state}
  const WeatherState({
    this.status = WeatherStatus.initial,
    this.weather = Weather.empty,
    this.temperatureUnits = TemperatureUnits.celsius,
  });

  /// Current weather status.
  final WeatherStatus status;

  /// Current weather data.
  final Weather weather;

  /// Current temperature units.
  final TemperatureUnits temperatureUnits;

  @override
  List<Object> get props => [status, weather, temperatureUnits];

  /// Returns a copy of this [WeatherState] with the given fields replaced.
  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    TemperatureUnits? temperatureUnits,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      temperatureUnits: temperatureUnits ?? this.temperatureUnits,
    );
  }
}
