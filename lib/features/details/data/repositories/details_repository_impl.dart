import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/details/data/datasources/details_datasource.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';

import '../../domain/repositories/details_repository.dart';

class IDetailsRepository implements DetailsRepository {
  final DetailsDatasource datasource;
  const IDetailsRepository({required this.datasource});

  @override
  Future<Either<Failure, ResponseCastEntity>> getMovieCast(
      {required int movieId}) async {
    try {
      return Right(await datasource.getMovieCast(movieId: movieId));
    } catch (_) {
      return Left(const ServerFailure());
    }
  }
}
