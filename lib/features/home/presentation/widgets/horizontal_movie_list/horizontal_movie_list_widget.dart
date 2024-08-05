import 'package:flutter/material.dart';
import 'package:movieflix/features/home/presentation/widgets/horizontal_movie_list/movie_rating_widget.dart';
import 'package:movieflix/shared/widgets/texts/category_title_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/movie/movies_entity.dart';

class HorizontalMovieListWidget extends StatelessWidget {
  final String title;
  final List<MovieEntity> movies;
  const HorizontalMovieListWidget(
      {super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryTitleWidget(title: title),
        SizedBox(
          height: 22.h,
          child: ListView.builder(
            itemCount: movies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: 1.5.h),
              child: MovieRatingWidget(movie: movies[index]),
            ),
          ),
        ),
      ],
    );
  }
}
