
import 'package:de_weather/src/core/constants.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/presentation/screens/weather/weather_data_widget.dart';
import 'package:de_weather/src/presentation/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key, required this.place});

  final Places place;



  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          place.name,
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Gap(10),
        const Text(
          "Today",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        const Gap(10),
        SizedBox(
            height: 200,
            width: 200,
            child: SvgPicture.asset(
                Utility.getAsset(place.weather!.current.temperature))),
        
        const Gap(10),
        Text("${place.weather!.current.temperature.toString()}°",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherDataWidget(
                  data: place.weather!.current.uvIndex.toString(),
                  title: Constants.uvIndex),
              Container(height: 60, width: 1, color: Colors.white),
              WeatherDataWidget(
                  data: "${place.weather!.current.windSpeed.toString()} m/s",
                  title: Constants.uvIndex),
              Container(height: 60, width: 1, color: Colors.white),
              WeatherDataWidget(
                  data: "${place.weather!.current.humidity.toString()}%",
                  title: Constants.uvIndex),
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
              itemCount: place.weather!.hourly.time.length,
              itemBuilder: (context, index) {
                final times = place.weather!.hourly;
                DateTime dateTime = DateTime.parse(times.time[index]);
    
                String formattedTime = DateFormat.Hm().format(dateTime);
    
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        formattedTime,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 10.0),
                      // Icon(
                      //   getIcon(times.temperature[index]),
                      //   color: Colors.white,
                      // ),
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: SvgPicture.asset(
                              Utility.getAsset(times.temperature[index]))),
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
    );
  }
}