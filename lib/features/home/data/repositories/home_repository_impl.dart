import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/exceptions.dart';
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
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseMovieEntity>> getPopularMovies() async {
    try {
      return Right(await datasource.getPopularMovies());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ResponseMovieEntity>> getTopRatedMovies() async {
    try {
      return Right(await datasource.getTopRatedMovies());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
