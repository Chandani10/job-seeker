
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_seeker/network/api_end_points.dart';
import 'interceptor.dart';

final clientProvider = Provider((ref) => Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 20),
    baseUrl: baseUrl))
  ..interceptors.add(DioInterceptor())
  ..interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
  ))
);

