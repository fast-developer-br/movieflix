import 'package:either_dart/either.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie/response_movie_entity.dart';
import '../repositories/home_repository.dart';

class GetPopularMoviesUsecase extends UseCase<ResponseMovieEntity, NoParams> {
  final HomeRepository repository;
  GetPopularMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, ResponseMovieEntity>> call(
      {required NoParams params}) {
    return repository.getPopularMovies();
  }
}
