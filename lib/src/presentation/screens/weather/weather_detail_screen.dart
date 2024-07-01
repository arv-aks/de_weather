import 'package:auto_route/auto_route.dart';
import 'package:de_weather/injection.dart';
import 'package:de_weather/src/application/blocs/weather/weather_cubit.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart';
import 'package:de_weather/src/presentation/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.place});

  final Places place;

  String getAsset(double temperature) {
    if (temperature >30 ) {
      // return "assets/cold.svg"; // Cold temperature icon
       return "assets/sun.svg"; 
    } else if (temperature >= 20 && temperature < 30) {
      return "assets/partial_cloudy.svg"; // Moderate temperature icon
    } else if (temperature < 30) {
      return "assets/sun.svg"; // Warm temperature icon
    } else {
      return "assets/heat.svg"; // Hot temperature icon
    }
  }

  Color getColorBasedOnTemperature(double temperature) {
    Color partialCloudy = const Color(0xff62ACF3);
    Color cloudy = const Color(0xffACA5A5);
    Color sunny = const Color(0xffF4B87D);
    Color rainy = const Color(0xff546A95);

    if (temperature >= 30) {
      return sunny;
    } else if (temperature >= 20 && temperature < 30) {
      return partialCloudy;
    } else if (temperature >= 10 && temperature < 20) {
      return cloudy;
    } else {
      return rainy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(getIt<WeatherRepostory>())
          ..getSelectedCityWeather(place.location),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: !state.isLoading
                  ? state.weather != null
                      ? getColorBasedOnTemperature(
                          state.weather!.current.temperature)
                      : Colors.white
                  : Colors.white,
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
           
              ),
              body: state.isLoading
                  ? const CustomLoading()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            place.name,
                            style: const TextStyle( color: Colors.white,
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Gap(10),
                          const Text(
                            "Today",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 20, fontWeight: FontWeight.w300),
                          ),
                          const Gap(10),
                          SizedBox(
                              height: 200,
                              width: 200,
                              child: SvgPicture.asset(getAsset(
                                  state.weather!.current.temperature))),
                          const Gap(10),
                          Text(
                              "${state.weather!.current.temperature.toString()}°",
                              style: const TextStyle(
                                 color: Colors.white,
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          const Gap(10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DataView(
                                    data: state.weather!.current.uvIndex
                                        .toString(),
                                    title: 'UV INDEX'),
                                Container(
                                    height: 60, width: 1, color: Colors.white),
                                DataView(
                                    data:
                                        "${state.weather!.current.windSpeed.toString()} m/s",
                                    title: 'WIND'),
                                Container(
                                    height: 60, width: 1, color: Colors.white),
                                DataView(
                                    data:
                                        "${state.weather!.current.humidity.toString()}%",
                                    title: 'HUMIDITY'),
                              ],
                            ),
                          ),
                          const Gap(16),
                          SizedBox(
                            height: 120,
                            child: Center(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemCount: state.weather!.hourly.time.length,
                                itemBuilder: (context, index) {
                                  final times = state.weather!.hourly;
                                  DateTime dateTime =
                                      DateTime.parse(times.time[index]);

                                  String formattedTime =
                                      DateFormat.Hm().format(dateTime);

                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        color:   Colors.grey.withOpacity(0.5),),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          formattedTime,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 10.0),
                                        // Icon(
                                        //   getIcon(times.temperature[index]),
                                        //   color: Colors.white,
                                        // ),
                                        SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: SvgPicture.asset(getAsset(
                                                times.temperature[index]))),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          "${times.temperature[index]}°",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          },
        ));
    /*
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
      
        child: BlocProvider(
          create: (context) => WeatherCubit(getIt<WeatherRepostory>())
            ..getSelectedCityWeather(place.location),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              return state.isLoading
                  ? const CustomLoading()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            place.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Gap(10),
                          const Text(
                            "Today",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                              "${state.weather!.current.temperature.toString()}°",
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                          const Gap(10),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DataView(
                                    data: state.weather!.current.uvIndex
                                        .toString(),
                                    title: 'UV INDEX'),
                                Container(
                                    height: 60, width: 1, color: Colors.white),
                                DataView(
                                    data:
                                        "${state.weather!.current.windSpeed.toString()} m/s",
                                    title: 'WIND'),
                                Container(
                                    height: 60, width: 1, color: Colors.white),
                                DataView(
                                    data:
                                        "${state.weather!.current.humidity.toString()}%",
                                    title: 'HUMIDITY'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            child: Center(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(width: 16);
                                },
                                itemCount: state.weather!.hourly.time.length,
                                itemBuilder: (context, index) {
                                  final times = state.weather!.hourly;
                                  DateTime dateTime =
                                      DateTime.parse(times.time[index]);

                                  String formattedTime =
                                      DateFormat.Hm().format(dateTime);

                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        color: const Color(0xff749EFF)),
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          formattedTime,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 10.0),
                                        // Icon(
                                        //   getIcon(times.temperature[index]),
                                        //   color: Colors.white,
                                        // ),
                                        SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: SvgPicture.asset(getAsset(
                                                times.temperature[index]))),
                                        const SizedBox(height: 10.0),
                                        Text(
                                          "${times.temperature[index]}°",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    ); */
  }
}

class DataView extends StatelessWidget {
  const DataView({super.key, required this.data, required this.title});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        Gap(8),
        Text(
          data,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
