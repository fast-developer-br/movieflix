import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/home/domain/usecases/get_popular_movies_usecase.dart';

import '../../../../../../core/usecase/usecase.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUsecase usecase;
  PopularMoviesCubit({required this.usecase}) : super(PopularMoviesInitial());

  getPopularMovies() async {
    await usecase.call(params: NoParams()).either(
        (left) => emit(const PopularMoviesError(errorMessage: '')),
        (right) => emit(PopularMoviesSuccess(response: right)));
  }
}
