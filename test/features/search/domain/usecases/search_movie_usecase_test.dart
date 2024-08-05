import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/search/domain/repositories/search_repository.dart';
import 'package:movieflix/features/search/domain/usecases/search_movie_usecase.dart';

import '../../../../fixtures/movie/response_movie_mock.dart';
import 'search_movie_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late SearchMovieUsecase useCase;
  late SearchRepository repository;
  late String search;

  setUp(() {
    repository = MockSearchRepository();
    useCase = SearchMovieUsecase(repository: repository);
    search = 'Harry Potter';
  });

  group('[SearchRepository] -', () {
    test('Should return a Right - Search Movie', () async {
      provideDummy<Either<Failure, ResponseMovieEntity>>(
          Right(responseMovieMock));
      when(repository.searchMovie(search: search))
          .thenAnswer((_) async => Right(responseMovieMock));

      final result = await useCase.call(params: search);
      expect(result, isA<Right>());

      verify(repository.searchMovie(search: search));
      verifyNoMoreInteractions(repository);
    });

    test('Should return a Left, and the Left need be a Server Failure',
        () async {
      provideDummy<Either<Failure, ResponseMovieEntity>>(
          Right(responseMovieMock));
      when(repository.searchMovie(search: search))
          .thenAnswer((_) async => const Left(ServerFailure()));

      final result = await useCase.call(params: search);
      expect(result, isA<Left>());

      verify(repository.searchMovie(search: search));
      verifyNoMoreInteractions(repository);
    });
  });
}
