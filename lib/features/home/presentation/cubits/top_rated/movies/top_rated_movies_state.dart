part of 'top_rated_movies_cubit.dart';

sealed class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

final class TopRatedMoviesInitial extends TopRatedMoviesState {}

final class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final ResponseMovieEntity response;
  const TopRatedMoviesSuccess({required this.response});
}

final class TopRatedMoviesError extends TopRatedMoviesState {
  final String errorMessage;
  const TopRatedMoviesError({required this.errorMessage});
}
