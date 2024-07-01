import 'dart:convert';

import 'package:de_weather/src/core/constants.dart';
import 'package:de_weather/src/infrastructure/api_provider.dart';
import 'package:de_weather/src/infrastructure/local/local_data_source.dart';
import 'package:de_weather/src/infrastructure/local/local_weather.dart';
import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WeatherRepostory {
  final Dio _dio;
  final WeatherDaoImpl _localDataSource;

  WeatherRepostory(this._localDataSource) : _dio = ApiProvider.getDio();

  Future<Either<String, WeatherModel>> getCurrentCityWeather(
      {required Places place}) async {
    try {
      final response = await _dio.get(
          "https://api.open-meteo.com/v1/forecast?latitude=${place.location.lat}&longitude=${place.location.long}&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,wind_speed_10m");
      final weather = WeatherModel.fromJson(jsonDecode(response.toString()));

      return Right(weather);
    } catch (e) {
      return Left('${Constants.weatherAppError} ${e.toString()}');
    }
  }

  Future<Either<String, WeatherModel>> getSelectedCityWeather(
      {required Places place}) async {
    try {
      final response = await _dio.get(
          "https://api.open-meteo.com/v1/forecast?latitude=${place.location.lat}&longitude=${place.location.long}&current=temperature_2m,wind_speed_10m,relative_humidity_2m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m");
      final weather = WeatherModel.fromJson(jsonDecode(response.toString()));

      // await _localDataSource.saveLocalWeather(
      //     weather: LocalWeather(place: place, weather: weather));

      return Right(weather);
    } catch (e) {
      print("hello reponse: ${e.toString()}");
      return Left('${Constants.weatherAppError} ${e.toString()}');
    }
  }
}
