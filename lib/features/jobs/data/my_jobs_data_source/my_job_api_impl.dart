



import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_seeker/features/jobs/data/my_jobs_data_source/my_job_api.dart';
import 'package:job_seeker/network/exception.dart';
import 'package:job_seeker/network/network_provider.dart';



final myJobsApiProvider = Provider<MyJobs>((ref) => JobsApiImpl(ref));

class JobsApiImpl implements MyJobs{

  final Ref _ref;

  JobsApiImpl(this._ref);

  @override
  Future<Response> getJobs({required String pathParam, required Map<String, dynamic> queryParam}) async {
    try {
      final response = await _ref.read(clientProvider).get( pathParam ,queryParameters: queryParam);
      return response;
    } on DioException catch (error) {
      debugPrint('******exc_get_job $error');
      throw DataException.fromDioError(error);
    }
  }





}