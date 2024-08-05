import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/network/http_services.dart';

import '../../../../core/network/api_consts.dart';
import '../models/cast/response_cast_model.dart';

abstract class DetailsDatasource {
  Future<ResponseCastModel> getMovieCast({required int movieId});
}

class IDetailsDataSource implements DetailsDatasource {
  final HttpServices client;
  const IDetailsDataSource({required this.client});

  @override
  Future<ResponseCastModel> getMovieCast({required int movieId}) async {
    try {
      final response = await client.get(ApiConsts.castMovie(movieId),
          queryParameters: {'language': 'pt-BR'});
      if (response.statusCode == 200) {
        return ResponseCastModel.fromJson(response.data);
      }
      throw const ServerException();
    } catch (_) {
      rethrow;
    }
  }
}
