// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:de_weather/src/infrastructure/model/location/location.dart';

part 'places.g.dart';

@HiveType(typeId: 2)
class Places extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final Location location;
  Places({
    required this.name,
    required this.location,
  });

  Places copyWith({
    String? name,
    Location? location,
  }) {
    return Places(
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location.toMap(),
    };
  }

  factory Places.fromMap(Map<String, dynamic> map) {
    return Places(
      name: map['name'] as String,
      location: Location.fromMap(map['location'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Places.fromJson(String source) =>
      Places.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Places(name: $name, location: $location)';

  @override
  bool operator ==(covariant Places other) {
    if (identical(this, other)) return true;

    return other.name == name && other.location == location;
  }

  @override
  int get hashCode => name.hashCode ^ location.hashCode;
}
