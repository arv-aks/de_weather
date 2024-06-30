import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(builder: (context, state) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: state is Loading
                  ? const CustomLoading()
                  : ElevatedButton(
                      onPressed: () {
                        context
                            .read<AppBloc>()
                            .add(LoginSubmitted('arvindaks2552@gmail.com', "password"));
                      },
                      child: const Text('Login'),
                    ),
            ),
          ],
        ),
      );
    }, listener: (context, state) {
      if(state is Authenticated){
        context.router.replace(const HomeRoute());
      }
    },);
  }
}
