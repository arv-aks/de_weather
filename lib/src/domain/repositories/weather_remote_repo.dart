import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/result.dart';

abstract class WeatherRemoteRepo {
  Future<Result<Places>> getCurrentCityWeather({required Places place});

  Future<Result<Places>> getSelectedCityWeather({required Places place});
}
