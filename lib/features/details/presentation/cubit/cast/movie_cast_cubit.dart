import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/features/details/domain/entities/cast/response_cast_entity.dart';
import 'package:movieflix/features/details/domain/usecases/get_movie_cast_usecase.dart';

part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  final GetMovieCastUsecase usecase;
  MovieCastCubit({required this.usecase}) : super(MovieCastInitial());

  getMovieCast({required int movieId}) async {
    await usecase.call(params: movieId).either(
        (left) => emit(const MovieCastError()),
        (right) => emit(MovieCastSuccess(response: right)));
  }
}
