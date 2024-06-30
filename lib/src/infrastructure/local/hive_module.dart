import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @lazySingleton
  @preResolve
  Future<Box> getHive() async {
    await Hive.initFlutter();

    return Hive.openBox('de_weather');
  }
}
