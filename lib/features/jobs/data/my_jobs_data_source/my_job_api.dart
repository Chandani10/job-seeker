

import 'package:dio/dio.dart';

abstract class MyJobs{

  Future<Response> getJobs({required String pathParam ,required  Map<String, dynamic> queryParam});



}