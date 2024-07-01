import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    navigate();
  }

  void navigate() async {
    // await Future.delayed(const Duration(seconds: 2)).then((_) {
    //   final authState = context.read<AppBloc>().state;

    //   authState.maybeMap(
    //     (_) {},
    //     authenticated: (_) {
    //       context.replaceRoute(const HomeRoute());
    //     },
    //     unauthenticated: (_) {
    //       context.router.replace(const LoginRoute());
    //     },
    //     orElse: () {},
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(builder: (context, state) {
      return const Scaffold(
      body: Center(
        child: Icon(
          Icons.code,
          color: Colors.black,
        ),
      ),
    );
    }, listener: (context, state) {
       if (state is Authenticated) {
           context.replaceRoute(const HomeRoute());
          }
          if (state is Unauthenticated) {
            context.replaceRoute(const LoginRoute());
          }
    },);
  }
}
