import 'package:equatable/equatable.dart';

import 'movies_entity.dart';

class ResponseMovieEntity extends Equatable {
  final List<MovieEntity> results;
  final int page;
  final int totalPages;
  final int totalResults;

  const ResponseMovieEntity({
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [results, page, totalPages, totalResults];
}
