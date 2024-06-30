import 'package:auto_route/auto_route.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<AppBloc>().add(const AppLogoutRequested());
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: const Center(
            child: Text('Home Screen'),
          ),
        );
      },
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.router.replace(LoginRoute());
        }
      },
    );
    // return BlocBuilder<AppBloc, AppState>(
    //   builder: (context, state) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         actions: [
    //           IconButton(
    //               onPressed: () {
    //                 context.read<AppBloc>().add(const AppLogoutRequested());
    //               },
    //               icon: const Icon(Icons.logout))
    //         ],
    //       ),
    //       body: const Center(
    //         child: Text('Home Screen'),
    //       ),
    //     );
    //   },
    // );
  }
}
