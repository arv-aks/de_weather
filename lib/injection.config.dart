// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:de_weather/src/core/app_module.dart' as _i7;
import 'package:de_weather/src/infrastructure/local/local_data_source.dart'
    as _i3;
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart'
    as _i6;
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart'
    as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.WeatherDaoImpl>(() => _i3.WeatherDaoImpl());
    gh.lazySingleton<_i4.FirebaseAuth>(() => appModule.firbaseAuth);
    gh.lazySingleton<_i5.WeatherRepostory>(
        () => _i5.WeatherRepostory(gh<_i3.WeatherDaoImpl>()));
    gh.lazySingleton<_i6.AuthRepository>(
        () => _i6.AuthRepository(firebaseAuth: gh<_i4.FirebaseAuth>()));
    return this;
  }
}

class _$AppModule extends _i7.AppModule {}
