part of 'popular_movies_cubit.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final ResponseMovieEntity response;
  const PopularMoviesSuccess({required this.response});
}

final class PopularMoviesError extends PopularMoviesState {
  final String errorMessage;
  const PopularMoviesError({required this.errorMessage});
}
