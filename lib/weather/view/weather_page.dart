import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/search/search.dart';
import 'package:weather/weather/weather.dart';

/// {@template weather_page}
/// A page that displays the weather information.
/// {@endtemplate}
class WeatherPage extends StatelessWidget {
  /// {@macro weather_page}
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(context.read<WeatherRepository>()),
      child: const WeatherView(),
    );
  }
}

/// {@template weather_view}
/// The view which renders the weather information.
/// {@endtemplate}
class WeatherView extends StatefulWidget {
  /// {@macro weather_view}
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Weather')),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return switch (state.status) {
              WeatherStatus.initial => const WeatherEmpty(),
              WeatherStatus.loading => const WeatherLoading(),
              WeatherStatus.success => WeatherPopulated(
                weather: state.weather,
                units: state.temperatureUnits,
                onRefresh: () {
                  return context.read<WeatherBloc>().add(
                    const WeatherRefreshRequested(),
                  );
                },
              ),
              WeatherStatus.failure => const WeatherError(),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () async {
          final city = await Navigator.of(
            context,
          ).push<String>(SearchPage.route());
          if (city != null && context.mounted) {
            context.read<WeatherBloc>().add(WeatherFetched(city));
          }
        },
      ),
    );
  }
}
