import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_seeker/features/jobs/data/my_jobs_data_source/my_job_api_impl.dart';
import 'package:job_seeker/features/jobs/domain/jobs_model/job_response_model.dart';
import 'package:job_seeker/features/jobs/domain/state/job_list_state.dart';
import 'package:job_seeker/network/api_end_points.dart';
import 'package:job_seeker/network/exception.dart';

final myJobRepoProvider = Provider<MyJobRepo>((ref) => MyJobRepo(ref));

class MyJobRepo {
  List<JobModel> jobList = [];

  final Ref _ref;

  MyJobRepo(this._ref);


  Future <JobList>  getJobList({required double lat,required double long })  async {

    Map<String, dynamic> queryParam = {
      'limit' : '1000',
      'skip' : '0',
      'lat' : lat,
      'lng' : long
    };

    try {
      final response = await _ref.read(myJobsApiProvider).getJobs(pathParam: getJobsEndPoint , queryParam: queryParam );
      if(response.statusCode == 200){
        if(json.decode(response.data)['data'] != null){
          jobList = (json.decode(response.data)['data']['data']['jobs'] as List<dynamic>).map((jobs) => JobModel.fromJson(jobs)).toList();
            return JobList(values: jobList, );
          }
        }
        else{
        return JobList(values: jobList, );
        }
      }
    catch(e){
      if (e is DataException) {
        rethrow;
      } else {
        throw DataException.customException('Service temporarily unavailable. Please try again after some time!');
      }
    }
    return const JobList(values: [], );

  }



}