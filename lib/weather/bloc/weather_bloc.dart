import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather/models/models.dart';
import 'package:weather/weather/repositories/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';

/// {@template weather_bloc}
/// Bloc which manages the weather state.
/// {@endtemplate}
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  /// {@macro weather_bloc}
  WeatherBloc(this._weatherRepository) : super(const WeatherState()) {
    on<WeatherFetched>(_onWeatherFetched);
    on<WeatherRefreshRequested>(_onWeatherRefreshRequested);
  }

  final WeatherRepository _weatherRepository;

  Future<void> _onWeatherFetched(
    WeatherFetched event,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final weather = await _weatherRepository.getWeather(event.city);
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weather.copyWith(location: event.city),
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }

  Future<void> _onWeatherRefreshRequested(
    WeatherRefreshRequested event,
    Emitter<WeatherState> emit,
  ) async {
    if (!state.status.isSuccess) return;
    if (state.weather == Weather.empty) return;
    try {
      final weather = await _weatherRepository.getWeather(
        state.weather.location,
      );
      emit(
        state.copyWith(
          status: WeatherStatus.success,
          weather: weather.copyWith(location: state.weather.location),
        ),
      );
    } catch (error) {
      emit(state);
    }
  }
}
