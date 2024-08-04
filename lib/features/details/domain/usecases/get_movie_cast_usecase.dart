import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/core/usecase/usecase.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';
import 'package:movieflix/features/details/domain/repositories/details_repository.dart';

class GetMovieCastUsecase implements UseCase<ResponseCastEntity, int> {
  final DetailsRepository repository;
  GetMovieCastUsecase({required this.repository});

  @override
  Future<Either<Failure, ResponseCastEntity>> call({required int params}) {
    return repository.getMovieCast(movieId: params);
  }
}
