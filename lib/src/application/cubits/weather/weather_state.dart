part of 'weather_cubit.dart';

enum CurrentLocationStatus{
  progress, 
  success, 
  failure,
}

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(false) bool isLoading,
    @Default(null) Places? place,
    @Default(true) bool isInternetConnected,
    @Default(null) bool? isLocationPermissionEnabled,
    @Default(false) bool deviceLocationReceivedSuccessfully,
    @Default(CurrentLocationStatus.progress) CurrentLocationStatus currentLocationStatus,

  }) = _WeatherState;

  factory WeatherState.initial() => const WeatherState();
}
