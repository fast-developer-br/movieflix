import 'package:movieflix/core/network/api_consts.dart';

import '../../../../core/network/http_services.dart';
import '../models/upcoming/response_movie_model.dart';

abstract class HomeDatasource {
  Future<ResponseMovieModel> getUpcomingMovies();
  Future<ResponseMovieModel> getPopularMovies();
  Future<ResponseMovieModel> getTopRatedMovies();
}

class IHomeDataSource implements HomeDatasource {
  final HttpServices client;
  const IHomeDataSource({required this.client});

  @override
  Future<ResponseMovieModel> getUpcomingMovies() async {
    try {
      final response = await client.get(ApiConsts.listUpcomingMovies,
          queryParameters: {'language': 'pt-BR'});
      if (response.statusCode == 200) {
        return ResponseMovieModel.fromJson(response.data);
      }
      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<ResponseMovieModel> getPopularMovies() async {
    try {
      final response = await client.get(ApiConsts.listUpcomingMovies,
          queryParameters: {'language': 'pt-BR'});
      if (response.statusCode == 200) {
        return ResponseMovieModel.fromJson(response.data);
      }
      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }

  @override
  Future<ResponseMovieModel> getTopRatedMovies() async {
    try {
      final response = await client.get(ApiConsts.listTopRatedMovies,
          queryParameters: {'language': 'pt-BR'});
      if (response.statusCode == 200) {
        return ResponseMovieModel.fromJson(response.data);
      }
      throw Exception();
    } catch (_) {
      throw Exception();
    }
  }
}
