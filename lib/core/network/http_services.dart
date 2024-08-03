import 'package:dio/dio.dart';

import '../errors/exceptions.dart';

abstract class HttpServices {
  Future<Response> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}

class HHttpServices implements HttpServices {
  final Dio client;

  const HHttpServices({required this.client});

  @override
  Future<Response> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return client.get(path, queryParameters: queryParameters);
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  @override
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return client.post(path, queryParameters: queryParameters, data: data);
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  @override
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      return client.put(path, queryParameters: queryParameters, data: data);
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  @override
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return client.delete(path, data: data);
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
