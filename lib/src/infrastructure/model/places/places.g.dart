// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlacesAdapter extends TypeAdapter<Places> {
  @override
  final int typeId = 2;

  @override
  Places read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Places(
      name: fields[0] as String,
      location: fields[1] as Location,
      weather: fields[2] as WeatherModel?,
      lastSyncedTime: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Places obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.weather)
      ..writeByte(3)
      ..write(obj.lastSyncedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
