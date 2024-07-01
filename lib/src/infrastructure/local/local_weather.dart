import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
import 'package:hive/hive.dart';

part 'local_weather.g.dart';

@HiveType(typeId: 1)
class LocalWeather extends HiveObject{
  LocalWeather({
    required this.place,
    required this.weather,
  });

  @HiveField(0)
  Places place;

  @HiveField(1)
  WeatherModel weather;
}
