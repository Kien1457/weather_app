import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

enum WeatherCondition { clear, rainy, cloudy, snowy, unknown }

@JsonSerializable()
class Weather {
  const Weather({required this.temperature, required this.weatherCode});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  final double temperature;
  @JsonKey(name: 'weathercode')
  final double weatherCode;

  WeatherCondition get condition {
    switch (weatherCode.toInt()) {
      case 0:
        return WeatherCondition.clear;
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return WeatherCondition.cloudy;
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return WeatherCondition.rainy;
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return WeatherCondition.snowy;
      default:
        return WeatherCondition.unknown;
    }
  }

  @override
  String toString() =>
      '''Weather(temperature: $temperature, weatherCode: $weatherCode)''';
}
