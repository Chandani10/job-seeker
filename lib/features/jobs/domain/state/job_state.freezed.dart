// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$JobState {
  bool get isMapView => throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobStateCopyWith<JobState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStateCopyWith<$Res> {
  factory $JobStateCopyWith(JobState value, $Res Function(JobState) then) =
      _$JobStateCopyWithImpl<$Res, JobState>;
  @useResult
  $Res call({bool isMapView, LatLng? currentLocation});
}

/// @nodoc
class _$JobStateCopyWithImpl<$Res, $Val extends JobState>
    implements $JobStateCopyWith<$Res> {
  _$JobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMapView = null,
    Object? currentLocation = freezed,
  }) {
    return _then(_value.copyWith(
      isMapView: null == isMapView
          ? _value.isMapView
          : isMapView // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JobPageStateCopyWith<$Res>
    implements $JobStateCopyWith<$Res> {
  factory _$$_JobPageStateCopyWith(
          _$_JobPageState value, $Res Function(_$_JobPageState) then) =
      __$$_JobPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isMapView, LatLng? currentLocation});
}

/// @nodoc
class __$$_JobPageStateCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$_JobPageState>
    implements _$$_JobPageStateCopyWith<$Res> {
  __$$_JobPageStateCopyWithImpl(
      _$_JobPageState _value, $Res Function(_$_JobPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMapView = null,
    Object? currentLocation = freezed,
  }) {
    return _then(_$_JobPageState(
      isMapView: null == isMapView
          ? _value.isMapView
          : isMapView // ignore: cast_nullable_to_non_nullable
              as bool,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$_JobPageState extends _JobPageState {
  const _$_JobPageState({this.isMapView = true, this.currentLocation = null})
      : super._();

  @override
  @JsonKey()
  final bool isMapView;
  @override
  @JsonKey()
  final LatLng? currentLocation;

  @override
  String toString() {
    return 'JobState(isMapView: $isMapView, currentLocation: $currentLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobPageState &&
            (identical(other.isMapView, isMapView) ||
                other.isMapView == isMapView) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMapView, currentLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobPageStateCopyWith<_$_JobPageState> get copyWith =>
      __$$_JobPageStateCopyWithImpl<_$_JobPageState>(this, _$identity);
}

abstract class _JobPageState extends JobState {
  const factory _JobPageState(
      {final bool isMapView, final LatLng? currentLocation}) = _$_JobPageState;
  const _JobPageState._() : super._();

  @override
  bool get isMapView;
  @override
  LatLng? get currentLocation;
  @override
  @JsonKey(ignore: true)
  _$$_JobPageStateCopyWith<_$_JobPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
