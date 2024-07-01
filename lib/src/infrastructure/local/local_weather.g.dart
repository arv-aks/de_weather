// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalWeatherAdapter extends TypeAdapter<LocalWeather> {
  @override
  final int typeId = 1;

  @override
  LocalWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalWeather(
      place: fields[0] as Places,
      weather: fields[1] as WeatherModel,
    );
  }

  @override
  void write(BinaryWriter writer, LocalWeather obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.place)
      ..writeByte(1)
      ..write(obj.weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
