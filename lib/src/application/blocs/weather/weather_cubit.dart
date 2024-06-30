import 'package:de_weather/src/infrastructure/model/weather.dart';
import 'package:de_weather/src/infrastructure/repositories/weather_repostory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.dart';

part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._weatherRepostory,
  ) : super(WeatherState.initial());

  final WeatherRepostory _weatherRepostory;

  void started() async {


    //ask for location //todo

    emit(state.copyWith(isLoading: true));

    final result = await _weatherRepostory.getCurrentCityWeather(
        latitude: "52.52", longitude: "13.41");

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(isLoading: false, weather: r));
      },
    );
  }
}
