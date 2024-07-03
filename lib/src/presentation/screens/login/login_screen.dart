import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/utils/app_theme.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: state is Loading
                    ? const CustomLoading(color: AppTheme.accentColor)
                    : TextButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          context.read<AppBloc>().add(LoginSubmitted(
                              emailController.text.trim(),
                              passwordController.text));
                        },
                        child: const Text('Login'),
                      ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is Authenticated) {
          context.router.replace(const HomeRoute());
        }
        if (state is LoginError) {
          Fluttertoast.showToast(
              msg: 'Login Error: ${state.message}',
              toastLength: Toast.LENGTH_LONG);
        }
      },
    );
  }
}
