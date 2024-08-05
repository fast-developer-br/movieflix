import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/search/data/datasources/search_datasource.dart';
import 'package:movieflix/features/search/data/repositories/search_repository_impl.dart';
import 'package:movieflix/features/search/domain/repositories/search_repository.dart';

import '../../../../fixtures/movie/response_movie_mock.dart';
import 'search_repository_test.mocks.dart';

@GenerateMocks([SearchDataSource])
void main() {
  late SearchDataSource dataSource;
  late SearchRepository repository;
  late String search;

  setUp(() {
    dataSource = MockSearchDataSource();
    repository = ISearchRepository(datasource: dataSource);
    search = 'Harry Potter';
  });

  group("[SearchRepository] -", () {
    test("should return [ResponseMovieEntity] when calls the datasource",
        () async {
      //arrange
      when(dataSource.searchMovie(search: search))
          .thenAnswer((_) async => responseMovieMock);
      // act
      final result = await repository.searchMovie(search: search);

      // assert
      expect(result, isA<Right>());
      expect(result.fold((left) => left, (right) => right), responseMovieMock);
    });

    test("should return [ServerException] when calls the datasource", () async {
      //arrange
      when(dataSource.searchMovie(search: search))
          .thenThrow(const ServerException());
      // act
      final result = await repository.searchMovie(search: search);

      // assert
      expect(result, isA<Left>());
      expect(
          result.fold((left) => left, (right) => right), const ServerFailure());
    });
  });
}
