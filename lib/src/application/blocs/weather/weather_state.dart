part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(false) bool isLoading,
    required WeatherModel? weather,
  }) = _WeatherState;

  factory WeatherState.initial() => const WeatherState(
        isLoading: false,
        weather: null,
      );
}
