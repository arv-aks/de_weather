import 'package:auto_route/auto_route.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/cubits/weather/weather_cubit.dart';
import 'package:de_weather/src/domain/repositories/weather_remote_repo.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/presentation/screens/weather/weather_view.dart';
import 'package:de_weather/src/presentation/utils/app_theme.dart';
import 'package:de_weather/src/presentation/utils/utilities.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.place});

  final Places place;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(getIt<WeatherRemoteRepo>())
          ..getSelectedCityWeather(place),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: !state.isLoading && state.place != null
                  ? state.place!.weather != null
                      ? Utility.getColorBasedOnTemperature(
                          state.place!.weather!.current.temperature)
                      : AppTheme.onPrimaryColor
                  : AppTheme.onPrimaryColor,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              body: state.isLoading
                  ? const CustomLoading()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: WeatherView(
                        place: state.place!,
                      ),
                    ),
            );
          },
          listener: (context, state) {
            if (!state.isInternetConnected) {
              Fluttertoast.showToast(
                  msg: 'No internet connection. Unable to fetch new Data',
                  toastLength: Toast.LENGTH_LONG);
            }
          },
        ));
  }
}
