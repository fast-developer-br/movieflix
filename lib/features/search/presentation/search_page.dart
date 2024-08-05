import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/search/presentation/cubit/search/search_movie_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/widgets/shimmer/card_shimmer_widget.dart';
import '../../home/presentation/widgets/horizontal_movie_list/movie_rating_widget.dart';
import 'widgets/search_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarWidget(),
        BlocBuilder(
          bloc: Modular.get<SearchMovieCubit>(),
          builder: (context, state) {
            if (state is SearchMovieLoading) {
              return const CardShimmerWidget();
            }
            if (state is SearchMovieSuccess) {
              if (state.response.results.isEmpty) {
                return const Expanded(
                  child: Center(
                      child: Text('O filme pesquisado não foi encontrado')),
                );
              }
              return Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: state.response.results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .55,
                            crossAxisCount: 3,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) => MovieRatingWidget(
                        movie: state.response.results[index])),
              );
            }
            return Container();
          },
        )
      ],
    );
  }
}
