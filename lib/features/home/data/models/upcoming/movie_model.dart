import 'package:movieflix/features/home/domain/entities/movie/movies_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage,
      required super.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        releaseDate: DateTime.parse(json['release_date']),
        title: json['title'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
