import 'package:dio/dio.dart';


class DataException implements Exception {

  String message = 'Sorry for the inconvenience caused! Please try again later!';

  DataException.fromDioError(DioException dioError) {

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Your request has been cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Please try later! your network seems to be slow';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Please try later! receive timeout in connection with api server';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Please try later! send timeout in connection with api server';
        break;

      case DioExceptionType.connectionError:
        message = 'Please check if the internet connection is working!';
        break;

      case DioExceptionType.unknown:
        if(dioError.error != null && dioError.error.toString().contains('SocketException')){
          message = 'Please check if the internet connection is working!';
          break;
        }
        message = 'Please try again later!';
        break;

      default:  if(dioError.message == 'SocketException') {
        DataException.customException('noInternet');
      }
      break;
    }
  }

  DataException.customException(String errorMessage) {
    if(errorMessage == 'noInternet'){
      message = 'Please check if the internet connection is working!';
    }else{
      message = errorMessage;
    }
  }



  @override
  String toString() => message;
}
