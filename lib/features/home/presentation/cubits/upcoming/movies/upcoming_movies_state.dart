part of 'upcoming_movies_cubit.dart';

sealed class UpcomingMoviesState extends Equatable {
  const UpcomingMoviesState();

  @override
  List<Object> get props => [];
}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}

final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final ResponseMovieEntity response;
  const UpcomingMoviesSuccess({required this.response});
}

final class UpcomingMoviesError extends UpcomingMoviesState {
  final String errorMessage;
  const UpcomingMoviesError({required this.errorMessage});
}
