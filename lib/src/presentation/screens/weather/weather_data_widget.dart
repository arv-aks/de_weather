import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class WeatherDataWidget extends StatelessWidget {
  const WeatherDataWidget({super.key, required this.data, required this.title});

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        const Gap(8),
        Text(
          data,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
