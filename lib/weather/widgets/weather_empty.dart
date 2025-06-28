import 'package:flutter/material.dart';

/// {@template weather_empty}
/// Widget displayed when no weather data is available.
/// {@endtemplate}
class WeatherEmpty extends StatelessWidget {
  /// {@macro weather_empty}
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🏙️', style: TextStyle(fontSize: 64)),
        Text('Please search for a city!', style: theme.textTheme.headlineSmall),
      ],
    );
  }
}

/// {@template weather_loading}
/// Widget displayed when weather data is being fetched.
/// {@endtemplate}
class WeatherLoading extends StatelessWidget {
  /// {@macro weather_loading}
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('⛅', style: TextStyle(fontSize: 64)),
        Text('Loading Weather', style: theme.textTheme.headlineSmall),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}

/// {@template weather_error}
/// Widget displayed when an error occurs fetching weather data.
/// {@endtemplate}
class WeatherError extends StatelessWidget {
  /// {@macro weather_error}
  const WeatherError({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text('Something went wrong!', style: theme.textTheme.headlineSmall),
      ],
    );
  }
}
