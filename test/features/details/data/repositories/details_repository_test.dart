import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/details/data/datasources/details_datasource.dart';
import 'package:movieflix/features/details/data/repositories/details_repository_impl.dart';
import 'package:movieflix/features/details/domain/repositories/details_repository.dart';

import '../../../../fixtures/movie/response_cast_movie_mock.dart';
import 'details_repository_test.mocks.dart';

@GenerateMocks([DetailsDatasource])
void main() {
  late DetailsDatasource dataSource;
  late DetailsRepository repository;

  setUp(() {
    dataSource = MockDetailsDatasource();
    repository = IDetailsRepository(datasource: dataSource);
  });

  group("[DetailsRepository] -", () {
    test("should return [ResponseDetailsEntity] when calls the datasource",
        () async {
      //arrange
      when(dataSource.getMovieCast(movieId: 519182))
          .thenAnswer((_) async => responseCastMovieMock);
      // act
      final result = await repository.getMovieCast(movieId: 519182);

      // assert
      expect(result, isA<Right>());
      expect(
          result.fold((left) => left, (right) => right), responseCastMovieMock);
    });

    test("should return [ServerException] when calls the datasource", () async {
      //arrange
      when(dataSource.getMovieCast(movieId: 519182))
          .thenThrow(const ServerException());
      // act
      final result = await repository.getMovieCast(movieId: 519182);

      // assert
      expect(result, isA<Left>());
      expect(
          result.fold((left) => left, (right) => right), const ServerFailure());
    });
  });
}
