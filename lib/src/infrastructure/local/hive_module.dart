import 'package:de_weather/src/infrastructure/local/local_weather.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class WeatherDao {
  Future<void> init();

  Future<void> saveLocalWeather({required LocalWeather weather});

  Future<LocalWeather?> getLocalWeather();

  Future<void> clear();
}
