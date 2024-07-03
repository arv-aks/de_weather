
import 'package:de_weather/src/domain/repositories/weather_local_repo.dart';
import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: WeatherLocalRepo)
class WeatherLocalRepoImpl extends WeatherLocalRepo {
  late final Box<Places> weatherBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(PlacesAdapter())
      ..registerAdapter(LocationAdapter())
      ..registerAdapter(WeatherModelImplAdapter())
      ..registerAdapter(CurrentImplAdapter())
      ..registerAdapter(HourlyImplAdapter());

    weatherBox = await Hive.openBox<Places>('de_weather');
  }

  @override
  Future<void> clear() async {
    await weatherBox.clear();
  }

  @override
  Future<Places?> getLocalWeather() async {
    return weatherBox.get('test');
  }

  @override
  Future<void> saveLocalWeather({required Places weather}) async {
    await weatherBox.put('test', weather);
  }
}
