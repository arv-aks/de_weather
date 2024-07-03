import 'package:auto_route/auto_route.dart';
import 'package:de_weather/gen/assets.gen.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.images.heat, height: 100, width: 200),
              const Text(
                'Weather App',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          )),
        );
      },
      listener: (context, state) {
        if (state is Authenticated) {
          Future.delayed(const Duration(seconds: 2)).then((_) {
            context.replaceRoute(const HomeRoute());
          });
        }
        if (state is Unauthenticated) {
          Future.delayed(const Duration(seconds: 2)).then((_) {
            context.replaceRoute(const LoginRoute());
          });
        }
      },
    );
  }
}
