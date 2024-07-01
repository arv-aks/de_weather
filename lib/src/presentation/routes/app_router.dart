import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/presentation/screens/home/home_screen.dart';
import 'package:de_weather/src/presentation/screens/login/login_screen.dart';
import 'package:de_weather/src/presentation/screens/search/search_screen.dart';
import 'package:de_weather/src/presentation/screens/splash/splash_screen.dart';
import 'package:de_weather/src/presentation/screens/weather/weather_detail_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  // final authgaurd = AuthGaurd(AppBloc(authRepository: getIt<AuthRepository>()));
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SearchRoute.page),
        AutoRoute(page: WeatherRoute.page),
      ];
}
