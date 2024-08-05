import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:movieflix/core/errors/failures.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';
import 'package:movieflix/features/details/domain/repositories/details_repository.dart';
import 'package:movieflix/features/details/domain/usecases/get_movie_cast_usecase.dart';

import '../../../../fixtures/movie/response_cast_movie_mock.dart';
import 'get_cast_movies_test.mocks.dart';

@GenerateMocks([DetailsRepository])
void main() {
  late GetMovieCastUsecase useCase;
  late MockDetailsRepository repository;

  setUp(() {
    repository = MockDetailsRepository();
    useCase = GetMovieCastUsecase(repository: repository);
  });

  group('[DetailsRepository] -', () {
    test('Should return a Right - Cast Movie', () async {
      provideDummy<Either<Failure, ResponseCastEntity>>(
          Right(responseCastMovieMock));
      when(repository.getMovieCast(movieId: 519182))
          .thenAnswer((_) async => Right(responseCastMovieMock));

      final result = await useCase.call(params: 519182);
      expect(result, isA<Right>());

      verify(repository.getMovieCast(movieId: 519182));
      verifyNoMoreInteractions(repository);
    });

    test('Should return a Left, and the Left need be a Server Failure',
        () async {
      provideDummy<Either<Failure, ResponseCastEntity>>(
          Right(responseCastMovieMock));
      when(repository.getMovieCast(movieId: 519182))
          .thenAnswer((_) async => const Left(ServerFailure()));

      final result = await useCase.call(params: 519182);
      expect(result, isA<Left>());

      verify(repository.getMovieCast(movieId: 519182));
      verifyNoMoreInteractions(repository);
    });
  });
}
