import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/core/usecase/usecase.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/home/domain/repositories/home_repository.dart';

class GetUpcomingMoviesUsecase extends UseCase<ResponseMovieEntity, NoParams> {
  final HomeRepository repository;
  GetUpcomingMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, ResponseMovieEntity>> call(
      {required NoParams params}) {
    return repository.getUpcomingMovies();
  }
}
