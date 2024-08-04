import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/core/usecase/usecase.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/home/domain/usecases/get_upcoming_movies_usecase.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  final GetUpcomingMoviesUsecase usecase;
  UpcomingMoviesCubit({required this.usecase}) : super(UpcomingMoviesInitial());

  getUpcomingMovies() async {
    await usecase.call(params: NoParams()).either(
        (left) => emit(const UpcomingMoviesError(errorMessage: '')),
        (right) => emit(UpcomingMoviesSuccess(response: right)));
  }
}
