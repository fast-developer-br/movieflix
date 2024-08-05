import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/search/data/datasources/search_datasource.dart';
import 'package:movieflix/features/search/domain/repositories/search_repository.dart';

class ISearchRepository implements SearchRepository {
  final SearchDataSource datasource;
  const ISearchRepository({required this.datasource});

  @override
  Future<Either<Failure, ResponseMovieEntity>> searchMovie(
      {required String search}) async {
    try {
      return Right(await datasource.searchMovie(search: search));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
