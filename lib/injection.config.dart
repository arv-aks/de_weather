// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:de_weather/src/core/app_module.dart' as _i7;
import 'package:de_weather/src/infrastructure/local/hive_module.dart' as _i8;
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart'
    as _i6;
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart'
    as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    final hiveModule = _$HiveModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => appModule.firbaseAuth);
    gh.lazySingleton<_i4.WeatherRepostory>(() => _i4.WeatherRepostory());
    await gh.lazySingletonAsync<_i5.Box<dynamic>>(
      () => hiveModule.getHive(),
      preResolve: true,
    );
    gh.lazySingleton<_i6.AuthRepository>(
        () => _i6.AuthRepository(firebaseAuth: gh<_i3.FirebaseAuth>()));
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}

class _$HiveModule extends _i8.HiveModule {}
