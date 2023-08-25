import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:job_seeker/features/jobs/data/my_jobs_repo/my_jobs_repo.dart';
import 'package:job_seeker/features/jobs/domain/state/job_list_state.dart';
import 'package:job_seeker/features/jobs/domain/state/job_state.dart';
import 'package:permission_handler/permission_handler.dart';


final jobListAPIController = StateNotifierProvider.family.autoDispose<JobListAPIControllerClass,AsyncValue<JobList>, LatLng>((ref, position) {
  return JobListAPIControllerClass(ref, position);
});

class JobListAPIControllerClass extends StateNotifier<AsyncValue<JobList>> {
  final Ref _ref;
  final LatLng? position;
  JobListAPIControllerClass(this._ref,  this.position) : super(const AsyncValue.loading()) {
    getAllUsers(position!);
  }

  getAllUsers(LatLng position) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _ref.read(myJobRepoProvider).getJobList(lat: position.latitude, long: position.longitude));
  }
}




final jobStateController = StateNotifierProvider<JobStateController, JobState>((ref) => JobStateController(ref));

class JobStateController extends StateNotifier<JobState> {
  final Ref ref;
  JobStateController(this.ref) : super(const JobState());




  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    log("check location permission $permission");
   if(permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if(serviceEnabled){
        final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        setCurrentLocation(LatLng(position.latitude, position.longitude));
      }
    }
   else{
     openAppSettings();
   }
  }


  setDefaultView(final bool isMapView) {
    state = state.copyWith(isMapView: isMapView);
  }


  setCurrentLocation(final LatLng latLng){
    state = state.copyWith(currentLocation: latLng );
  }


}