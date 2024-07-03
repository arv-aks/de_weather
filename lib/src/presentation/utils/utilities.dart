import 'package:de_weather/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class Utility {
  static String getAsset(double temperature) {
    if (temperature >= 30) {
      return Assets.images.heat; // Hot temperature icon
    } else if (temperature >= 20 && temperature < 30) {
      return Assets.images.partialCloudy; // Moderate temperature icon
    } else if (temperature >= 10 && temperature < 20) {
      return Assets.images.sun; // Warm temperature icon
    } else {
      return Assets.images.cold; // Cold temperature icon
    }
  }

  static Color getColorBasedOnTemperature(double temperature) {
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
}
