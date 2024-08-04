import 'package:either_dart/either.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, ResponseMovieEntity>> getUpcomingMovies();
  Future<Either<Failure, ResponseMovieEntity>> getPopularMovies();
  Future<Either<Failure, ResponseMovieEntity>> getTopRatedMovies();
}
