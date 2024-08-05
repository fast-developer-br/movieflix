import 'package:flutter_test/flutter_test.dart';
import 'package:movieflix/features/home/data/models/upcoming/response_movie_model.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';

import '../../../../fixtures/movie/response_movie_mock.dart';

void main() {
  group("[ResponseMovieModel] -", () {
    test('should be a subclass of ResponseMovieEntity', () async {
      final result = responseMovieMock;
      expect(result, isA<ResponseMovieEntity>());
    });

    test('should return a valid model ResponseMovieModel', () async {
      final result = responseMovieMock;
      expect(result, isA<ResponseMovieModel>());
    });
  });
}
