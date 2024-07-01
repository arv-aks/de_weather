import 'package:de_weather/src/infrastructure/model/location/location.dart';
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/model/weather/weather.dart';
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
        // latitude: "52.52", longitude: "13.41"
        place:
            Places(name: 'Delhi', location: Location(lat: 52.52, long: 13.41)));

    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        emit(state.copyWith(isLoading: false, weather: r));
      },
    );
  }

  void getSelectedCityWeather(Location location) async {
    emit(state.copyWith(isLoading: true));

    final result = await _weatherRepostory.getSelectedCityWeather(
        place: Places(name: "delhi", location: location));

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
