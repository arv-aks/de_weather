// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:de_weather/src/core/app_module.dart' as _i9;
import 'package:de_weather/src/domain/repositories/weather_local_repo.dart'
    as _i4;
import 'package:de_weather/src/domain/repositories/weather_remote_repo.dart'
    as _i6;
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart'
    as _i8;
import 'package:de_weather/src/infrastructure/repositories/local/weather_local_repo_impl.dart'
    as _i5;
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart'
    as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
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
    gh.lazySingleton<_i3.FirebaseAuth>(() => appModule.firbaseAuth);
    gh.singleton<_i4.WeatherLocalRepo>(() => _i5.WeatherLocalRepoImpl());
    gh.singleton<_i6.WeatherRemoteRepo>(
        () => _i7.WeatherRepoImpl(gh<_i4.WeatherLocalRepo>()));
    gh.lazySingleton<_i8.AuthRepository>(
        () => _i8.AuthRepository(firebaseAuth: gh<_i3.FirebaseAuth>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
