import 'dart:async';

import 'package:de_weather/firebase_options.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() => runZonedGuarded(() async {
      await Sentry.init(
        (options) {
          options.dsn =
              "https://28ad7b5b4011dee977e6432249d583a7@o4507518838571008.ingest.us.sentry.io/4507518840930304";
        },
        appRunner: () async {
          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform);

          //configure DI
          await configureDependencies();

          // //initialize notification service
          // await PushNotificationService().initialize();

          // //initialize remote config
          // await getIt<RemoteConfigService>().initialize();

          runApp(MainApp());
        },
      );
    }, (error, stack) async {
      print("error: $error");
      print("stackTrace: $stack");
      
      await Sentry.captureException(error, stackTrace: stack);
    });

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return AppBloc(authRepository: getIt<AuthRepository>());
            },
          )
        ],
        child: MaterialApp.router(
          theme: ThemeData(useMaterial3: false),
          routerConfig: _appRouter.config(),
     
        ));
  }
}
