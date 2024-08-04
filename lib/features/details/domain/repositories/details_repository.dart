import 'package:either_dart/either.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class DetailsRepository {
  Future<Either<Failure, ResponseCastEntity>> getMovieCast(
      {required int movieId});
}
