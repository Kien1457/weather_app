import 'package:flutter_test/flutter_test.dart';
import 'package:open_meteo_api/open_meteo_api.dart';

void main() {
  group('OpenMeteoApiClient', () {
    test('can be instantiated', () {
      expect(OpenMeteoApiClient(), isNotNull);
    });

    test('Weather model can be created', () {
      const weather = Weather(temperature: 20.0, weatherCode: 0);
      expect(weather.temperature, 20.0);
      expect(weather.weatherCode, 0);
      expect(weather.condition, WeatherCondition.clear);
    });

    test('Location model can be created', () {
      const location = Location(
        id: 1,
        name: 'Test City',
        latitude: 40.7128,
        longitude: -74.0060,
      );
      expect(location.name, 'Test City');
      expect(location.latitude, 40.7128);
    });
  });
}
