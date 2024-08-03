import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../network/http_services.dart';
import '../network/network_info.dart';

class NetworkCoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);

    i.add<HttpServices>(HHttpServices.new);
    i.add(NetworkInfo.new);
    i.add<Dio>(() {
      final dio = Dio();
      if (kDebugMode) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          request: true,
          error: true,
        ));
      }
      return dio;
    });
  }
}
