import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/features/home/domain/entities/movie/movies_entity.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/modules/routes.dart';
import '../../../../../core/network/api_consts.dart';
import '../../../../../shared/widgets/images/images_network_widget.dart';
import '../../../../../shared/widgets/rating/circular_rating_widget.dart';

class MovieRatingWidget extends StatelessWidget {
  final MovieEntity movie;
  const MovieRatingWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () => Modular.to.pushNamed(
              '.${Routes.formatRoute(Routes.details)}',
              arguments: {'movie': movie}),
          child: SizedBox(
            width: 31.w,
            height: 20.h,
            child: ImagesNetworkWidget(
                radius: 15, imageUrl: ApiConsts.imageURL(movie.posterPath)),
          ),
        ),
        Positioned(
            left: 3.w,
            bottom: 0.h,
            child: CircularRatingWidget(rating: movie.rating))
      ],
    );
  }
}
