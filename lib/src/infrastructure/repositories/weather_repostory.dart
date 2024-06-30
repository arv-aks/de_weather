import 'dart:convert';

import 'package:de_weather/src/core/constants.dart';
import 'package:de_weather/src/infrastructure/api_provider.dart';
import 'package:de_weather/src/infrastructure/model/weather.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class WeatherRepostory {
  final Dio _dio;

  WeatherRepostory() : _dio = ApiProvider.getDio();

  Future<Either<String, WeatherModel>> getCurrentCityWeather({
    required String latitude, 
    required String longitude
  }) async {
    try {
      final response = await _dio.get(
          "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,wind_speed_10m");
      final weather = WeatherModel.fromJson(jsonDecode(response.toString()));

      return Right(weather);
    } catch (e) {
      return Left('${Constants.weatherAppError} ${e.toString()}');
    }
  }
}
