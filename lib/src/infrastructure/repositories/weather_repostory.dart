import 'dart:convert';

import 'package:de_weather/src/core/constants.dart';
import 'package:de_weather/src/domain/repositories/weather_local_repo.dart';
import 'package:de_weather/src/domain/repositories/weather_remote_repo.dart';
import 'package:de_weather/src/infrastructure/api_provider.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
import 'package:de_weather/src/infrastructure/result.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: WeatherRemoteRepo)
class WeatherRepoImpl extends WeatherRemoteRepo {
  final Dio _dio;
  final WeatherLocalRepo _localRepo;

  WeatherRepoImpl(this._localRepo) : _dio = ApiProvider.getDio();

  @override
  Future<Result<Places>> getCurrentCityWeather({required Places place}) async {
    try {
      final response = await _dio.get(
          "${WeatherConstants.baseURL}?latitude=${place.location.lat}&longitude=${place.location.long}&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,wind_speed_10m");
      final weather = WeatherModel.fromJson(jsonDecode(response.toString()));

      final updatedPlace =
          place.copyWith(weather: weather, lastSyncedTime: DateTime.now());

      await _localRepo.saveLocalWeather(weather: updatedPlace);

      return Success(data: updatedPlace, isInternetConnected: true);
    } on DioException catch (exception) {
    
      if (exception.type == DioExceptionType.connectionError) {
        //get data from local
        final result = await _localRepo.getLocalWeather();

        if (result != null) {
          return Success(data: result, isInternetConnected: false);
        } else {
          return Error(message: "Error", exception: Exception("No data found"));
        }
      } else {
        return Error(message: "Error", exception: exception);
      }
    } on Exception catch (e) {
      return Error(message: "Error", exception: e);
    }
  }

  @override
  Future<Result<Places>> getSelectedCityWeather({required Places place}) async {
    try {
      final response = await _dio.get(
          "${WeatherConstants.baseURL}?latitude=${place.location.lat}&longitude=${place.location.long}&current=temperature_2m,wind_speed_10m,relative_humidity_2m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m");

      final weather = WeatherModel.fromJson(jsonDecode(response.toString()));

      final updatedPlace =
          place.copyWith(weather: weather, lastSyncedTime: DateTime.now());

      await _localRepo.saveLocalWeather(weather: updatedPlace);

      return Success(data: updatedPlace, isInternetConnected: true);
    } on DioException catch (exception) {

      if (exception.type == DioExceptionType.connectionError) {
        //get data from local
        final result = await _localRepo.getLocalWeather();

        if (result != null) {
          return Success(data: result, isInternetConnected: false);
        } else {
          return Error(message: "Error", exception: Exception("No data found"));
        }
      } else {
        return Error(message: "Error", exception: exception);
      }
    } on Exception catch (e) {

      return Error(message: "Error", exception: e);
    }
  }
}
