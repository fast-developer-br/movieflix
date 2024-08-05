import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, ResponseMovieEntity>> searchMovie(
      {required String search});
}
