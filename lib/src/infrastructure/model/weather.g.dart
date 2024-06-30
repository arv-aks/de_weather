// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'hourly': instance.hourly,
    };

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      time: json['time'] as String? ?? '',
      temperature: (json['temperature_2m'] as num?)?.toDouble() ?? 0.0,
      windSpeed: (json['wind_speed_10m'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
    };

_$HourlyImpl _$$HourlyImplFromJson(Map<String, dynamic> json) => _$HourlyImpl(
      time:
          (json['time'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      temperature: (json['temperature_2m'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
      windSpeed: (json['wind_speed_10m'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HourlyImplToJson(_$HourlyImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
    };
