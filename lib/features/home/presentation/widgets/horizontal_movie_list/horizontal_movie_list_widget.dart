import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/modules/routes.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/shared/widgets/images/images_network_widget.dart';
import 'package:movieflix/shared/widgets/texts/category_title_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../shared/widgets/rating/circular_rating_widget.dart';
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
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () => Modular.to.pushNamed(
                        '.${Routes.formatRoute(Routes.details)}',
                        arguments: {'movie': movies[index]}),
                    child: SizedBox(
                      width: 31.w,
                      height: 20.h,
                      child: ImagesNetworkWidget(
                          radius: 15,
                          imageUrl:
                              ApiConsts.imageURL(movies[index].posterPath)),
                    ),
                  ),
                  Positioned(
                      left: 3.w,
                      bottom: 0.h,
                      child: CircularRatingWidget(rating: movies[index].rating))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
