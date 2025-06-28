import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather/weather.dart';

void main() {
  runApp(const WeatherApp());
}

/// {@template weather_app}
/// The main app widget.
/// {@endtemplate}
class WeatherApp extends StatelessWidget {
  /// {@macro weather_app}
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => WeatherRepository(),
      child: MaterialApp(
        title: 'Flutter Weather',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const WeatherPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
