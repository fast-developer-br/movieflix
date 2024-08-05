import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/core/network/http_services.dart';
import 'package:movieflix/features/details/data/datasources/details_datasource.dart';
import 'package:movieflix/features/details/data/models/cast/response_cast_model.dart';

import '../../../../fixtures/movie/response_cast_movie_mock.dart';
import 'details_datasource_test.mocks.dart';

@GenerateMocks([HHttpServices])
void main() {
  late HHttpServices client;
  late DetailsDatasource datasource;

  setUp(() {
    client = MockHHttpServices();
    datasource = IDetailsDataSource(client: client);
  });

  group("[DetailsDataSource] -", () {
    test("Should return a search of ResponseCastModel", () async {
      when(client.get(ApiConsts.castMovie(519182),
              queryParameters: {'language': 'pt-BR'.toString()}))
          .thenAnswer((_) async => Response(
              data: jsonDecode(jsonResponseCastMovieMock),
              statusCode: 200,
              requestOptions: RequestOptions()));

      final result = await datasource.getMovieCast(movieId: 519182);
      expect(result, isA<ResponseCastModel>());
    });

    test(
      "Should return a ServerException",
      () async {
        when(client.get(ApiConsts.castMovie(519182),
                queryParameters: {'language': 'pt-BR'.toString()}))
            .thenAnswer((_) async => Response(
                data: null, statusCode: 500, requestOptions: RequestOptions()));
        final result = datasource.getMovieCast(movieId: 519182);
        await expectLater(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
