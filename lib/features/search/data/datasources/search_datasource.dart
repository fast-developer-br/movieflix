import 'package:movieflix/core/network/http_services.dart';

import '../../../../core/network/api_consts.dart';
import '../../../home/data/models/upcoming/response_movie_model.dart';

abstract class SearchDataSource {
  Future<ResponseMovieModel> searchMovie({required String search});
}

class ISearchDataSource implements SearchDataSource {
  final HttpServices client;
  const ISearchDataSource({required this.client});

  @override
  Future<ResponseMovieModel> searchMovie({required String search}) async {
    try {
      final response = await client.get(ApiConsts.searchMovie,
          queryParameters: {'query': search, 'language': 'pt-BR'});
      if (response.statusCode == 200) {
        return ResponseMovieModel.fromJson(response.data);
      }
      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }
}
