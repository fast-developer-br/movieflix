import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieflix/features/home/domain/entities/movie/response_movie_entity.dart';
import 'package:movieflix/features/search/domain/usecases/search_movie_usecase.dart';

part 'search_movie_state.dart';

class SearchMovieCubit extends Cubit<SearchMovieState> {
  final SearchMovieUsecase usecase;
  SearchMovieCubit({required this.usecase}) : super(SearchMovieInitial());

  searchMovie({required String search}) async {
    if (search.isEmpty) {
      emit(SearchMovieInitial());
    } else {
      emit(SearchMovieLoading());
      await usecase.call(params: search).either(
          (left) => emit(const SearchMovieError()),
          (right) => emit(SearchMovieSuccess(response: right)));
    }
  }
}
