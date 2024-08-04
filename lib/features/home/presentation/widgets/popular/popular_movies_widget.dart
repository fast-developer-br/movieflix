import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/home/presentation/cubits/popular/movies/popular_movies_cubit.dart';
import 'package:movieflix/features/home/presentation/widgets/horizontal_movie_list/horizontal_movie_list_widget.dart';
import 'package:movieflix/shared/widgets/shimmer/horizontal_shimmer_list_widget.dart';
import 'package:sizer/sizer.dart';

class PopularMoviesWidget extends StatefulWidget {
  const PopularMoviesWidget({super.key});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  @override
  void initState() {
    super.initState();
    Modular.get<PopularMoviesCubit>().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
        bloc: Modular.get<PopularMoviesCubit>(),
        builder: (context, state) {
          if (state is PopularMoviesSuccess) {
            return HorizontalMovieListWidget(
                title: 'POPULAR', movies: state.response.results);
          }
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: const HorizontalShimmerListWidget(),
          );
        });
  }
}
