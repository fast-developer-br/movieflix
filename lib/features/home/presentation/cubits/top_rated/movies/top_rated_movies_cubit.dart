import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/home/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../../../../../core/usecase/usecase.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMoviesUsecase usecase;
  TopRatedMoviesCubit({required this.usecase}) : super(TopRatedMoviesInitial());

  getTopRatedMovies() async {
    await usecase.call(params: NoParams()).either(
        (left) => emit(const TopRatedMoviesError(errorMessage: '')),
        (right) => emit(TopRatedMoviesSuccess(response: right)));
  }
}
