part of 'search_movie_cubit.dart';

sealed class SearchMovieState extends Equatable {
  const SearchMovieState();

  @override
  List<Object> get props => [];
}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieSuccess extends SearchMovieState {
  final ResponseMovieEntity response;
  const SearchMovieSuccess({required this.response});
}

final class SearchMovieError extends SearchMovieState {
  final String errorMessage;
  const SearchMovieError(
      {this.errorMessage = 'Não foi possível encontrar o filme'});
}
