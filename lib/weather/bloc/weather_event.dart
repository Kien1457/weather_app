part of 'weather_bloc.dart';

/// {@template weather_event}
/// Base class for all weather events.
/// {@endtemplate}
sealed class WeatherEvent extends Equatable {
  /// {@macro weather_event}
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

/// {@template weather_fetched}
/// Event added when user requests weather for a city.
/// {@endtemplate}
final class WeatherFetched extends WeatherEvent {
  /// {@macro weather_fetched}
  const WeatherFetched(this.city);

  /// The city to fetch weather for.
  final String city;

  @override
  List<Object> get props => [city];
}

/// {@template weather_refresh_requested}
/// Event added when user requests a refresh of the current weather.
/// {@endtemplate}
final class WeatherRefreshRequested extends WeatherEvent {
  /// {@macro weather_refresh_requested}
  const WeatherRefreshRequested();
}
