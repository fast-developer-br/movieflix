import 'package:flutter_test/flutter_test.dart';
import 'package:movieflix/features/details/data/models/cast/response_cast_model.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';

import '../../../../fixtures/movie/response_cast_movie_mock.dart';

void main() {
  group("[ResponseCastModel] -", () {
    test('should be a subclass of ResponseCastEntity', () async {
      final result = responseCastMovieMock;
      expect(result, isA<ResponseCastEntity>());
    });

    test('should return a valid model ResponseCastModel', () async {
      final result = responseCastMovieMock;
      expect(result, isA<ResponseCastModel>());
    });
  });
}
