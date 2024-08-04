part of 'movie_cast_cubit.dart';

sealed class MovieCastState extends Equatable {
  const MovieCastState();

  @override
  List<Object> get props => [];
}

final class MovieCastInitial extends MovieCastState {}

final class MovieCastSuccess extends MovieCastState {
  final ResponseCastEntity response;
  const MovieCastSuccess({required this.response});
}

final class MovieCastError extends MovieCastState {
  final String errorMessage;
  const MovieCastError(
      {this.errorMessage = 'Não foi possível exibir o elenco'});
}
