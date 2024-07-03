// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeatherState {
  bool get isLoading => throw _privateConstructorUsedError;
  Places? get place => throw _privateConstructorUsedError;
  bool get isInternetConnected => throw _privateConstructorUsedError;
  bool? get isLocationPermissionEnabled => throw _privateConstructorUsedError;
  bool get deviceLocationReceivedSuccessfully =>
      throw _privateConstructorUsedError;
  CurrentLocationStatus get currentLocationStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {bool isLoading,
      Places? place,
      bool isInternetConnected,
      bool? isLocationPermissionEnabled,
      bool deviceLocationReceivedSuccessfully,
      CurrentLocationStatus currentLocationStatus});
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? place = freezed,
    Object? isInternetConnected = null,
    Object? isLocationPermissionEnabled = freezed,
    Object? deviceLocationReceivedSuccessfully = null,
    Object? currentLocationStatus = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Places?,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationPermissionEnabled: freezed == isLocationPermissionEnabled
          ? _value.isLocationPermissionEnabled
          : isLocationPermissionEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceLocationReceivedSuccessfully: null ==
              deviceLocationReceivedSuccessfully
          ? _value.deviceLocationReceivedSuccessfully
          : deviceLocationReceivedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocationStatus: null == currentLocationStatus
          ? _value.currentLocationStatus
          : currentLocationStatus // ignore: cast_nullable_to_non_nullable
              as CurrentLocationStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Places? place,
      bool isInternetConnected,
      bool? isLocationPermissionEnabled,
      bool deviceLocationReceivedSuccessfully,
      CurrentLocationStatus currentLocationStatus});
}

/// @nodoc
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? place = freezed,
    Object? isInternetConnected = null,
    Object? isLocationPermissionEnabled = freezed,
    Object? deviceLocationReceivedSuccessfully = null,
    Object? currentLocationStatus = null,
  }) {
    return _then(_$WeatherStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as Places?,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationPermissionEnabled: freezed == isLocationPermissionEnabled
          ? _value.isLocationPermissionEnabled
          : isLocationPermissionEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      deviceLocationReceivedSuccessfully: null ==
              deviceLocationReceivedSuccessfully
          ? _value.deviceLocationReceivedSuccessfully
          : deviceLocationReceivedSuccessfully // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocationStatus: null == currentLocationStatus
          ? _value.currentLocationStatus
          : currentLocationStatus // ignore: cast_nullable_to_non_nullable
              as CurrentLocationStatus,
    ));
  }
}

/// @nodoc

class _$WeatherStateImpl implements _WeatherState {
  const _$WeatherStateImpl(
      {this.isLoading = false,
      this.place = null,
      this.isInternetConnected = true,
      this.isLocationPermissionEnabled = null,
      this.deviceLocationReceivedSuccessfully = false,
      this.currentLocationStatus = CurrentLocationStatus.progress});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final Places? place;
  @override
  @JsonKey()
  final bool isInternetConnected;
  @override
  @JsonKey()
  final bool? isLocationPermissionEnabled;
  @override
  @JsonKey()
  final bool deviceLocationReceivedSuccessfully;
  @override
  @JsonKey()
  final CurrentLocationStatus currentLocationStatus;

  @override
  String toString() {
    return 'WeatherState(isLoading: $isLoading, place: $place, isInternetConnected: $isInternetConnected, isLocationPermissionEnabled: $isLocationPermissionEnabled, deviceLocationReceivedSuccessfully: $deviceLocationReceivedSuccessfully, currentLocationStatus: $currentLocationStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.isInternetConnected, isInternetConnected) ||
                other.isInternetConnected == isInternetConnected) &&
            (identical(other.isLocationPermissionEnabled,
                    isLocationPermissionEnabled) ||
                other.isLocationPermissionEnabled ==
                    isLocationPermissionEnabled) &&
            (identical(other.deviceLocationReceivedSuccessfully,
                    deviceLocationReceivedSuccessfully) ||
                other.deviceLocationReceivedSuccessfully ==
                    deviceLocationReceivedSuccessfully) &&
            (identical(other.currentLocationStatus, currentLocationStatus) ||
                other.currentLocationStatus == currentLocationStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      place,
      isInternetConnected,
      isLocationPermissionEnabled,
      deviceLocationReceivedSuccessfully,
      currentLocationStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {final bool isLoading,
      final Places? place,
      final bool isInternetConnected,
      final bool? isLocationPermissionEnabled,
      final bool deviceLocationReceivedSuccessfully,
      final CurrentLocationStatus currentLocationStatus}) = _$WeatherStateImpl;

  @override
  bool get isLoading;
  @override
  Places? get place;
  @override
  bool get isInternetConnected;
  @override
  bool? get isLocationPermissionEnabled;
  @override
  bool get deviceLocationReceivedSuccessfully;
  @override
  CurrentLocationStatus get currentLocationStatus;
  @override
  @JsonKey(ignore: true)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
