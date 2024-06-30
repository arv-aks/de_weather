import 'package:auto_route/auto_route.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/application/blocs/weather/weather_cubit.dart';
import 'package:de_weather/src/infrastructure/repositories/auth_repository.dart';
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/screens/home/home_widgets.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> initLocationService() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      if (mounted) {
        await HomeUtils.showLocationServiceDialog(context, mounted);
      }
    } else {
      // await handleLocationPermission();
    }
  }

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
            body: BlocProvider(
              create: (context) =>
                  WeatherCubit(getIt<WeatherRepostory>())..started(),
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return state.isLoading
                      ? const CustomLoading()
                      :  Center(
                          child: Text(state.weather.toString()),
                        );
                },
              ),
            ));
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
