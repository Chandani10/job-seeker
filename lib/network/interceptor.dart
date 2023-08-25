import 'dart:developer';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log("Request[${options.method}] => PATH: ${options.path}");
    log(options.baseUrl + options.path);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response Status Code: [${response.statusCode}]");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async{
    log("Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
     if(err.type == DioExceptionType.badResponse){
      log('badResponse ${err.response}');
      return handler.resolve(err.response!);
    }
    super.onError(err, handler);
  }




}




