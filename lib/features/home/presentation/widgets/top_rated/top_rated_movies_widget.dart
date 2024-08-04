import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/home/presentation/cubits/top_rated/movies/top_rated_movies_cubit.dart';
import 'package:movieflix/features/home/presentation/widgets/horizontal_movie_list/horizontal_movie_list_widget.dart';
import 'package:movieflix/shared/widgets/shimmer/horizontal_shimmer_list_widget.dart';
import 'package:sizer/sizer.dart';

class TopRatedMoviesWidget extends StatefulWidget {
  const TopRatedMoviesWidget({super.key});

  @override
  State<TopRatedMoviesWidget> createState() => _TopRatedMoviesWidgetState();
}

class _TopRatedMoviesWidgetState extends State<TopRatedMoviesWidget> {
  @override
  void initState() {
    super.initState();
    Modular.get<TopRatedMoviesCubit>().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
        bloc: Modular.get<TopRatedMoviesCubit>(),
        builder: (context, state) {
          if (state is TopRatedMoviesSuccess) {
            return HorizontalMovieListWidget(
                title: 'MAIS VOTADOS', movies: state.response.results);
          }
          return Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: const HorizontalShimmerListWidget(),
          );
        });
  }
}
