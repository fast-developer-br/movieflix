import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieflix/core/errors/exceptions.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/core/network/http_services.dart';
import 'package:movieflix/features/home/data/models/upcoming/response_movie_model.dart';
import 'package:movieflix/features/search/data/datasources/search_datasource.dart';

import '../../../../fixtures/movie/response_movie_mock.dart';
import '../../../details/data/datasources/details_datasource_test.mocks.dart';

@GenerateMocks([HHttpServices])
void main() {
  late HHttpServices client;
  late SearchDataSource datasource;
  late String search;

  setUp(() {
    client = MockHHttpServices();
    datasource = ISearchDataSource(client: client);
    search = 'Harry Potter';
  });

  group("[SearchDataSource] -", () {
    test("Should return a search of ResponseMovieModel", () async {
      when(client.get(ApiConsts.searchMovie,
              queryParameters: {'query': search, 'language': 'pt-BR'}))
          .thenAnswer((_) async => Response(
              data: jsonDecode(jsonResponseMovieMock),
              statusCode: 200,
              requestOptions: RequestOptions()));

      final result = await datasource.searchMovie(search: search);
      expect(result, isA<ResponseMovieModel>());
    });

    test(
      "Should return a ServerException",
      () async {
        when(client.get(ApiConsts.searchMovie,
                queryParameters: {'query': search, 'language': 'pt-BR'}))
            .thenAnswer((_) async => Response(
                data: null, statusCode: 500, requestOptions: RequestOptions()));
        final result = datasource.searchMovie(search: search);
        await expectLater(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
