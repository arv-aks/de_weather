// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  @JsonKey(name: 'current')
  Current get current => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourly')
  Hourly get hourly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current') Current current,
      @JsonKey(name: 'hourly') Hourly hourly});

  $CurrentCopyWith<$Res> get current;
  $HourlyCopyWith<$Res> get hourly;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? hourly = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Current,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentCopyWith<$Res> get current {
    return $CurrentCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HourlyCopyWith<$Res> get hourly {
    return $HourlyCopyWith<$Res>(_value.hourly, (value) {
      return _then(_value.copyWith(hourly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current') Current current,
      @JsonKey(name: 'hourly') Hourly hourly});

  @override
  $CurrentCopyWith<$Res> get current;
  @override
  $HourlyCopyWith<$Res> get hourly;
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? hourly = null,
  }) {
    return _then(_$WeatherModelImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as Current,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherModelImpl with DiagnosticableTreeMixin implements _WeatherModel {
  _$WeatherModelImpl(
      {@JsonKey(name: 'current') required this.current,
      @JsonKey(name: 'hourly') required this.hourly});

  factory _$WeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherModelImplFromJson(json);

  @override
  @JsonKey(name: 'current')
  final Current current;
  @override
  @JsonKey(name: 'hourly')
  final Hourly hourly;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherModel(current: $current, hourly: $hourly)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherModel'))
      ..add(DiagnosticsProperty('current', current))
      ..add(DiagnosticsProperty('hourly', hourly));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.hourly, hourly) || other.hourly == hourly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, current, hourly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  factory _WeatherModel(
          {@JsonKey(name: 'current') required final Current current,
          @JsonKey(name: 'hourly') required final Hourly hourly}) =
      _$WeatherModelImpl;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$WeatherModelImpl.fromJson;

  @override
  @JsonKey(name: 'current')
  Current get current;
  @override
  @JsonKey(name: 'hourly')
  Hourly get hourly;
  @override
  @JsonKey(ignore: true)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return _Current.fromJson(json);
}

/// @nodoc
mixin _$Current {
  @JsonKey(name: 'time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m')
  double get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentCopyWith<Current> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCopyWith<$Res> {
  factory $CurrentCopyWith(Current value, $Res Function(Current) then) =
      _$CurrentCopyWithImpl<$Res, Current>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      @JsonKey(name: 'temperature_2m') double temperature,
      @JsonKey(name: 'wind_speed_10m') double windSpeed});
}

/// @nodoc
class _$CurrentCopyWithImpl<$Res, $Val extends Current>
    implements $CurrentCopyWith<$Res> {
  _$CurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentImplCopyWith<$Res> implements $CurrentCopyWith<$Res> {
  factory _$$CurrentImplCopyWith(
          _$CurrentImpl value, $Res Function(_$CurrentImpl) then) =
      __$$CurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') String time,
      @JsonKey(name: 'temperature_2m') double temperature,
      @JsonKey(name: 'wind_speed_10m') double windSpeed});
}

/// @nodoc
class __$$CurrentImplCopyWithImpl<$Res>
    extends _$CurrentCopyWithImpl<$Res, _$CurrentImpl>
    implements _$$CurrentImplCopyWith<$Res> {
  __$$CurrentImplCopyWithImpl(
      _$CurrentImpl _value, $Res Function(_$CurrentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? windSpeed = null,
  }) {
    return _then(_$CurrentImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentImpl with DiagnosticableTreeMixin implements _Current {
  _$CurrentImpl(
      {@JsonKey(name: 'time') this.time = '',
      @JsonKey(name: 'temperature_2m') this.temperature = 0.0,
      @JsonKey(name: 'wind_speed_10m') this.windSpeed = 0.0});

  factory _$CurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentImplFromJson(json);

  @override
  @JsonKey(name: 'time')
  final String time;
  @override
  @JsonKey(name: 'temperature_2m')
  final double temperature;
  @override
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Current(time: $time, temperature: $temperature, windSpeed: $windSpeed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Current'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('temperature', temperature))
      ..add(DiagnosticsProperty('windSpeed', windSpeed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, temperature, windSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      __$$CurrentImplCopyWithImpl<_$CurrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentImplToJson(
      this,
    );
  }
}

abstract class _Current implements Current {
  factory _Current(
      {@JsonKey(name: 'time') final String time,
      @JsonKey(name: 'temperature_2m') final double temperature,
      @JsonKey(name: 'wind_speed_10m') final double windSpeed}) = _$CurrentImpl;

  factory _Current.fromJson(Map<String, dynamic> json) = _$CurrentImpl.fromJson;

  @override
  @JsonKey(name: 'time')
  String get time;
  @override
  @JsonKey(name: 'temperature_2m')
  double get temperature;
  @override
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed;
  @override
  @JsonKey(ignore: true)
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return _Hourly.fromJson(json);
}

/// @nodoc
mixin _$Hourly {
  @JsonKey(name: 'time')
  List<String> get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m')
  List<double> get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_10m')
  List<double> get windSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyCopyWith<Hourly> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyCopyWith<$Res> {
  factory $HourlyCopyWith(Hourly value, $Res Function(Hourly) then) =
      _$HourlyCopyWithImpl<$Res, Hourly>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') List<String> time,
      @JsonKey(name: 'temperature_2m') List<double> temperature,
      @JsonKey(name: 'wind_speed_10m') List<double> windSpeed});
}

/// @nodoc
class _$HourlyCopyWithImpl<$Res, $Val extends Hourly>
    implements $HourlyCopyWith<$Res> {
  _$HourlyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? windSpeed = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as List<double>,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyImplCopyWith<$Res> implements $HourlyCopyWith<$Res> {
  factory _$$HourlyImplCopyWith(
          _$HourlyImpl value, $Res Function(_$HourlyImpl) then) =
      __$$HourlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') List<String> time,
      @JsonKey(name: 'temperature_2m') List<double> temperature,
      @JsonKey(name: 'wind_speed_10m') List<double> windSpeed});
}

/// @nodoc
class __$$HourlyImplCopyWithImpl<$Res>
    extends _$HourlyCopyWithImpl<$Res, _$HourlyImpl>
    implements _$$HourlyImplCopyWith<$Res> {
  __$$HourlyImplCopyWithImpl(
      _$HourlyImpl _value, $Res Function(_$HourlyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature = null,
    Object? windSpeed = null,
  }) {
    return _then(_$HourlyImpl(
      time: null == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature: null == temperature
          ? _value._temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as List<double>,
      windSpeed: null == windSpeed
          ? _value._windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyImpl with DiagnosticableTreeMixin implements _Hourly {
  _$HourlyImpl(
      {@JsonKey(name: 'time') final List<String> time = const [],
      @JsonKey(name: 'temperature_2m')
      final List<double> temperature = const [],
      @JsonKey(name: 'wind_speed_10m') final List<double> windSpeed = const []})
      : _time = time,
        _temperature = temperature,
        _windSpeed = windSpeed;

  factory _$HourlyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyImplFromJson(json);

  final List<String> _time;
  @override
  @JsonKey(name: 'time')
  List<String> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  final List<double> _temperature;
  @override
  @JsonKey(name: 'temperature_2m')
  List<double> get temperature {
    if (_temperature is EqualUnmodifiableListView) return _temperature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperature);
  }

  final List<double> _windSpeed;
  @override
  @JsonKey(name: 'wind_speed_10m')
  List<double> get windSpeed {
    if (_windSpeed is EqualUnmodifiableListView) return _windSpeed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_windSpeed);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Hourly(time: $time, temperature: $temperature, windSpeed: $windSpeed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Hourly'))
      ..add(DiagnosticsProperty('time', time))
      ..add(DiagnosticsProperty('temperature', temperature))
      ..add(DiagnosticsProperty('windSpeed', windSpeed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._temperature, _temperature) &&
            const DeepCollectionEquality()
                .equals(other._windSpeed, _windSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_temperature),
      const DeepCollectionEquality().hash(_windSpeed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      __$$HourlyImplCopyWithImpl<_$HourlyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyImplToJson(
      this,
    );
  }
}

abstract class _Hourly implements Hourly {
  factory _Hourly(
          {@JsonKey(name: 'time') final List<String> time,
          @JsonKey(name: 'temperature_2m') final List<double> temperature,
          @JsonKey(name: 'wind_speed_10m') final List<double> windSpeed}) =
      _$HourlyImpl;

  factory _Hourly.fromJson(Map<String, dynamic> json) = _$HourlyImpl.fromJson;

  @override
  @JsonKey(name: 'time')
  List<String> get time;
  @override
  @JsonKey(name: 'temperature_2m')
  List<double> get temperature;
  @override
  @JsonKey(name: 'wind_speed_10m')
  List<double> get windSpeed;
  @override
  @JsonKey(ignore: true)
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
