import '../../../domain/entities/movie/response_movie_entity.dart';
import 'movie_model.dart';

class ResponseMovieModel extends ResponseMovieEntity {
  const ResponseMovieModel(
      {required super.results,
      required super.page,
      required super.totalPages,
      required super.totalResults});

  factory ResponseMovieModel.fromJson(Map<String, dynamic> map) {
    List<MovieModel> listMovies = [];
    for (var movie in map['results']) {
      listMovies.add(MovieModel.fromJson(movie));
    }

    return ResponseMovieModel(
      results: listMovies,
      page: map['page'],
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
    );
  }
}
