import 'package:auto_route/auto_route.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/app/app_bloc.dart';
import 'package:de_weather/src/application/cubits/weather/weather_cubit.dart';
import 'package:de_weather/src/domain/repositories/weather_remote_repo.dart';
import 'package:de_weather/src/presentation/routes/app_router.dart';
import 'package:de_weather/src/presentation/widgets/search_widget.dart';
import 'package:de_weather/src/presentation/screens/weather/weather_view.dart';
import 'package:de_weather/src/presentation/utils/app_theme.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.replaceRoute(const LoginRoute());
        }
      },
      child: Scaffold(
          backgroundColor: AppTheme.onPrimaryColor,
          appBar: AppBar(
            title: const Text('Weather'),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
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
                  WeatherCubit(getIt<WeatherRemoteRepo>())..started(),
              child: BlocConsumer<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: state.isLoading
                        ? const CustomLoading()
                        : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SearchWidget.searchButton(
                                      fn: _focusNode,
                                      hint: "Search",
                                      onTap: () {
                                        _focusNode.unfocus();
                                        context.router
                                            .push(const SearchRoute());
                                      },
                                    ),
                                    const Gap(20),
                                    if (state.place != null)
                                      WeatherView(place: state.place!)
                                  ],
                                ),
                              ),
                  );
                },
                listener: (ctx, state) {
                  if (!state.isInternetConnected) {
                    Fluttertoast.showToast(
                        msg: 'No internet connection. Unable to fetch new Data',
                        toastLength: Toast.LENGTH_LONG);
                  }

                  if (state.isLocationPermissionEnabled != null &&
                      !state.isLocationPermissionEnabled!) {
                    showDialog(
                      context: ctx,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Permission not enabled. "),
                          content: const Text(
                              "Please enable the location permission."),
                          actions: [
                            TextButton(
                                onPressed: () async {
                                  await ctx
                                      .read<WeatherCubit>()
                                      .initLocation(openSettings: true);
                                },
                                child: const Text("Open"))
                          ],
                        );
                      },
                    );
                  }

                  if (state.currentLocationStatus ==
                      CurrentLocationStatus.progress) {
                    Fluttertoast.showToast(msg: "Getting current location.");
                  }

                  if (state.currentLocationStatus ==
                      CurrentLocationStatus.failure) {
                    Fluttertoast.showToast(
                        msg:
                            "Unable to get current location. Please try again");
                  }
                },
              ))),
    );
  }
}
