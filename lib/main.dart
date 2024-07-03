import 'package:de_weather/firebase_options.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/domain/repositories/weather_local_repo.dart';
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //configure DI
  await configureDependencies();
  //init local db
  await getIt<WeatherLocalRepo>().init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return AppBloc(authRepository: getIt<AuthRepository>())
                ..add(const AppUserChanged());
            },
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: _appRouter.config(),
        ));
  }
}
