// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';

import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';

part 'places.g.dart';

@HiveType(typeId: 2)
class Places extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Location location;

  @HiveField(2)
  WeatherModel? weather;

  @HiveField(3)
  DateTime? lastSyncedTime;

  Places({
    required this.name,
    required this.location,
    this.weather,
    this.lastSyncedTime,
  });

  Places copyWith({
    String? name,
    Location? location,
    WeatherModel? weather,
    DateTime? lastSyncedTime,
  }) {
    return Places(
      name: name ?? this.name,
      location: location ?? this.location,
      weather: weather ?? this.weather,
      lastSyncedTime: lastSyncedTime ?? this.lastSyncedTime,
    );
  }
}
