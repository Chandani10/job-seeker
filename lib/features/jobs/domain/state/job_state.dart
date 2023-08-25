


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'job_state.freezed.dart';




@freezed
class JobState with _$JobState{
  const factory JobState({
    @Default(true) bool isMapView,
    @Default(null) LatLng? currentLocation,
  }) = _JobPageState;
  const JobState._();
}