// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelImplAdapter extends TypeAdapter<_$WeatherModelImpl> {
  @override
  final int typeId = 4;

  @override
  _$WeatherModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$WeatherModelImpl(
      current: fields[0] as Current,
      hourly: fields[1] as Hourly,
    );
  }

  @override
  void write(BinaryWriter writer, _$WeatherModelImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.current)
      ..writeByte(1)
      ..write(obj.hourly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentImplAdapter extends TypeAdapter<_$CurrentImpl> {
  @override
  final int typeId = 5;

  @override
  _$CurrentImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CurrentImpl(
      time: fields[0] as String,
      temperature: fields[1] as double,
      windSpeed: fields[2] as double,
      humidity: fields[3] as double,
      uvIndex: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$CurrentImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.windSpeed)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.uvIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HourlyImplAdapter extends TypeAdapter<_$HourlyImpl> {
  @override
  final int typeId = 6;

  @override
  _$HourlyImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$HourlyImpl(
      time: (fields[0] as List).cast<String>(),
      temperature: (fields[1] as List).cast<double>(),
      windSpeed: (fields[2] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$HourlyImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.windSpeed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      humidity: (json['relative_humidity_2m'] as num?)?.toDouble() ?? 0.0,
      uvIndex: (json['uv_index_max'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature,
      'wind_speed_10m': instance.windSpeed,
      'relative_humidity_2m': instance.humidity,
      'uv_index_max': instance.uvIndex,
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
