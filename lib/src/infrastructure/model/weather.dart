// ignore_for_file: public_member_api_docs, sort_constructors_first, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class WeatherModel with _$WeatherModel {
  factory WeatherModel({
    @JsonKey(name: 'current') required Current current,
    @JsonKey(name: 'hourly') required Hourly hourly,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}

@freezed
class Current with _$Current {
  factory Current({
    @JsonKey(name: 'time') @Default('') String time,
    @JsonKey(name: 'temperature_2m') @Default(0.0) double temperature,
    @JsonKey(name: 'wind_speed_10m') @Default(0.0) double windSpeed,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Hourly with _$Hourly {
  factory Hourly({
    @JsonKey(name: 'time') @Default([]) List<String> time,
    @JsonKey(name: 'temperature_2m') @Default([]) List<double> temperature,
    @JsonKey(name: 'wind_speed_10m') @Default([]) List<double> windSpeed,
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
}
