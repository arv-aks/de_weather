import 'package:auto_route/auto_route.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
import 'package:de_weather/src/presentation/screens/home/home_screen.dart';
import 'package:de_weather/src/presentation/screens/login/login_screen.dart';
import 'package:de_weather/src/presentation/screens/splash/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final authgaurd = AuthGaurd(AppBloc(authRepository: getIt<AuthRepository>()));
  @override
  List<AutoRoute> get routes => [
        /// routes go here

        AutoRoute(page: SplashRoute.page, initial: true, guards: [authgaurd]),

        AutoRoute(page: HomeRoute.page),

        AutoRoute(page: LoginRoute.page),
      ];
}

class AuthGaurd extends AutoRouteGuard {
  const AuthGaurd(this.appBloc);
  final AppBloc appBloc;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    appBloc.state.maybeMap(
      (value) {
        print("vall: $value");
      },
      orElse: () {
        print("or else");
      },
      authenticated: (_) => resolver.next(),
      unauthenticated: (value) {
        print("unautenticated...");
        resolver.resolveNext(true);
      },
    );
  }
}
