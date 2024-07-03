import 'package:de_weather/src/infrastructure/model/places/places.dart';

abstract class WeatherLocalRepo {
  Future<void> init();

  Future<void> saveLocalWeather({required Places weather});

  Future<Places?> getLocalWeather();

  Future<void> clear();
}
