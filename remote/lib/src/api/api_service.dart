import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ApiService {
  @singleton
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = "https://api.nytimes.com/svc/";
    return dio;
  }
}

// coverage:ignore-start
class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    log('REQUEST[${options.toString()}]');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    log('RESPONSE[${response.toString()}]');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    log('ERROR[${err.response?.toString()}]');
    return super.onError(err, handler);
  }
}
// coverage:ignore-end
