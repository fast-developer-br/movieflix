import 'package:flutter/material.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/features/home/domain/entities/movie/movies_entity.dart';
import 'package:movieflix/shared/widgets/images/images_network_widget.dart';
import 'package:movieflix/shared/widgets/rating/circular_rating_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/colors/app_colors.dart';
import 'widgets/cast/movie_cast_widget.dart';
import 'widgets/details_movie_overview_widget.dart';

class DetailsPage extends StatelessWidget {
  final MovieEntity movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 30.h,
          child: ImagesNetworkWidget(
              imageUrl: ApiConsts.imageURL(movie.backdropPath), radius: 15),
        ),
        Padding(
          padding: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          movie.releaseDateFormatted,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: .3.w),
                    child: CircularRatingWidget(rating: movie.rating, size: 5),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: DetailsMovieOverviewWidget(overview: movie.overview),
              ),
              MovieCastWidget(movieId: movie.id)
            ],
          ),
        ),
      ]),
    );
  }
}
