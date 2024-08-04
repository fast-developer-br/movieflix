import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/home/data/datasources/home_datasource.dart';

import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';

import '../../domain/repositories/home_repository.dart';

class IHomeRespository implements HomeRepository {
  final HomeDatasource datasource;
  const IHomeRespository({required this.datasource});

  @override
  Future<Either<Failure, ResponseMovieEntity>> getUpcomingMovies() async {
    try {
      return Right(await datasource.getUpcomingMovies());
    } catch (_) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseMovieEntity>> getPopularMovies() async {
    try {
      return Right(await datasource.getPopularMovies());
    } catch (_) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseMovieEntity>> getTopRatedMovies() async {
    try {
      return Right(await datasource.getTopRatedMovies());
    } catch (_) {
      return Left(const ServerFailure());
    }
  }
}
