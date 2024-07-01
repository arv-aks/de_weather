import 'package:de_weather/src/infrastructure/local/hive_module.dart';
import 'package:de_weather/src/infrastructure/local/local_weather.dart';
import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class WeatherDaoImpl extends WeatherDao {
  late final Box<LocalWeather> weatherBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(LocalWeatherAdapter())
      ..registerAdapter(PlacesAdapter())
      ..registerAdapter(LocationAdapter())
      ..registerAdapter(WeatherModelImplAdapter())
      ..registerAdapter(CurrentImplAdapter())
      ..registerAdapter(HourlyImplAdapter());

    weatherBox = await Hive.openBox<LocalWeather>('de_weather');
  }

  @override
  Future<void> clear() async {
    await weatherBox.clear();
  }

  @override
  Future<LocalWeather?> getLocalWeather() async {
    return weatherBox.get('test');
  }

  @override
  Future<void> saveLocalWeather({required LocalWeather weather}) async {
    await weatherBox.put('test', weather);
  }
}
