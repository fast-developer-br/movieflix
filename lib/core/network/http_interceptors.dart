import 'package:dio/dio.dart';
import 'package:movieflix/core/network/api_consts.dart';

class HttpInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers
        .addAll({'Authorization': 'Bearer ${ApiConsts().getApiToken}'});
  }
}
