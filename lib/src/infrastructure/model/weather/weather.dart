// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherModel extends HiveObject with _$WeatherModel {
  WeatherModel._();
  @HiveType(typeId: 4)
  factory WeatherModel({
    @JsonKey(name: 'current') @HiveField(0) required Current current,
    @JsonKey(name: 'hourly') @HiveField(1) required Hourly hourly,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current extends HiveObject with _$Current {
  Current._();
  @HiveType(typeId: 5)
  factory Current({
    @JsonKey(name: 'time') @HiveField(0) @Default('') String time,
    @JsonKey(name: 'temperature_2m')
    @HiveField(1)
    @Default(0.0)
    double temperature,
    @JsonKey(name: 'wind_speed_10m')
    @HiveField(2)
    @Default(0.0)
    double windSpeed,
    @JsonKey(name: 'relative_humidity_2m')
    @HiveField(3)
    @Default(0.0)
    double humidity,
    @JsonKey(name: 'uv_index_max') @HiveField(4) @Default(0.0) double uvIndex,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Hourly extends HiveObject with _$Hourly {
  Hourly._();
  @HiveType(typeId: 6)
  factory Hourly({
    @JsonKey(name: 'time') @HiveField(0) @Default([]) List<String> time,
    @JsonKey(name: 'temperature_2m')
    @HiveField(1)
    @Default([])
    List<double> temperature,
    @JsonKey(name: 'wind_speed_10m')
    @HiveField(2)
    @Default([])
    List<double> windSpeed,
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}
