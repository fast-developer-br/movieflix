import 'package:either_dart/either.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/search/domain/repositories/search_repository.dart';

import '../../../../core/usecase/usecase.dart';

class SearchMovieUsecase implements UseCase<ResponseMovieEntity, String> {
  final SearchRepository repository;
  const SearchMovieUsecase({required this.repository});

  @override
  Future<Either<Failure, ResponseMovieEntity>> call({required String params}) {
    return repository.searchMovie(search: params);
  }
}
