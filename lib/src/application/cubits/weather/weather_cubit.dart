import 'package:de_weather/src/domain/repositories/weather_remote_repo.dart';
import 'package:de_weather/src/infrastructure/model/location/location.dart'
    as model_lt;
import 'package:de_weather/src/infrastructure/model/places/places.dart';
import 'package:de_weather/src/infrastructure/result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

part 'weather_state.dart';

part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(
    this._weatherRemoteRepo,
  ) : super(WeatherState.initial());

  final WeatherRemoteRepo _weatherRemoteRepo;

  late Position position;
  late Placemark placemark;

  void started() async {
    emit(state.copyWith(
        isLoading: true,
        currentLocationStatus: CurrentLocationStatus.progress));

    await initLocation();

    if (state.isLocationPermissionEnabled == null) return;

    if (state.isLocationPermissionEnabled!) {
      emit(state.copyWith(
          currentLocationStatus: CurrentLocationStatus.progress));
      final locationResult = await getCurrentLocation();

      if (locationResult is Success) {
        emit(state.copyWith(
            currentLocationStatus: CurrentLocationStatus.success));

        final lr = locationResult as Success;
        final result = await _weatherRemoteRepo.getCurrentCityWeather(
            place: Places(
                name: lr.data.$1.locality ?? "-",
                location: model_lt.Location(
                    lat: lr.data.$2.latitude, long: lr.data.$2.longitude)));

        if (result is Success<Places>) {
          final data = result.data;
          emit(state.copyWith(
              isLoading: false,
              place: data,
              isInternetConnected: result.isInternetConnected));
        }
      } else if (locationResult is Error) {
        emit(state.copyWith(
            isLoading: true,
            currentLocationStatus: CurrentLocationStatus.failure));

        final result = await _weatherRemoteRepo.getCurrentCityWeather(
            place: Places(
                name: "", location: model_lt.Location(lat: 0.0, long: 0.0)));

        if (result is Success<Places>) {
          final data = result.data;
          emit(state.copyWith(
              isLoading: false,
              place: data,
              isInternetConnected: result.isInternetConnected));
        }
      }
    }
  }

  Future<void> initLocation({bool openSettings = false}) async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (!isServiceEnabled) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      emit(state.copyWith(isLocationPermissionEnabled: true));
    }

    if (permission == LocationPermission.deniedForever) {
      if (openSettings) {
        emit(state.copyWith(
            isLocationPermissionEnabled: await openAppSettings()));
        return;
      }

      emit(state.copyWith(isLocationPermissionEnabled: false));
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(state.copyWith(isLocationPermissionEnabled: false));
      }
    }
  }

  Future<Result<(Placemark, Position)>> getCurrentLocation() async {
    try {
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              timeLimit: const Duration(seconds: 5))
          .then((position) async {
        this.position = position;
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        placemark = placemarks[0];

        // emit(state.copyWith(isDeviceLocationEnabled: true));
      });

      return Success(data: (placemark, position));
    } catch (err) {
      print("catced: $err");
      // emit(state.copyWith(isDeviceLocationEnabled: false));

      return Error(exception: Exception(err.toString()), message: "sdf");
    }
  }

  void getSelectedCityWeather(Places place) async {
    emit(state.copyWith(isLoading: true));

    print("inside getSelectedCityWeather");

    final result = await _weatherRemoteRepo.getSelectedCityWeather(
        place: Places(name: place.name, location: place.location));

    if (result is Success<Places>) {
      // print("success");
      final data = result.data;

      print("result..data: $data");
      emit(state.copyWith(
          isLoading: false,
          place: data,
          isInternetConnected: result.isInternetConnected));
    } else {
      print("Error");
    }
  }
}
