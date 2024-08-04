import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/shared/assets/app_assets.dart';
import 'package:movieflix/shared/colors/app_colors.dart';
import 'package:movieflix/shared/widgets/images/images_network_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../shared/widgets/shimmer/horizontal_shimmer_list_widget.dart';
import '../../cubit/cast/movie_cast_cubit.dart';

class MovieCastWidget extends StatefulWidget {
  final int movieId;
  const MovieCastWidget({super.key, required this.movieId});

  @override
  State<MovieCastWidget> createState() => _MovieCastWidgetState();
}

class _MovieCastWidgetState extends State<MovieCastWidget> {
  @override
  void initState() {
    super.initState();
    Modular.get<MovieCastCubit>().getMovieCast(movieId: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: Modular.get<MovieCastCubit>(),
      builder: (context, state) {
        if (state is MovieCastSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ELENCO',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
                child: ListView.builder(
                    itemCount: state.response.casts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final cast = state.response.casts[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 3.w, top: 2.h),
                        child: Column(
                          children: [
                            if (cast.profilePath != null) ...[
                              SizedBox(
                                height: 12.h,
                                width: 12.h,
                                child: ImagesNetworkWidget(
                                    isCircle: true,
                                    imageUrl:
                                        ApiConsts.imageURL(cast.profilePath!)),
                              )
                            ] else ...[
                              SizedBox(
                                height: 12.h,
                                child: CircleAvatar(
                                  maxRadius: 6.h,
                                  backgroundColor: AppColors.backgroundRating,
                                  backgroundImage:
                                      const AssetImage(AppAssets.circleLogo),
                                ),
                              )
                            ],
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Text(cast.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9.sp)),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        }
        return const HorizontalShimmerListWidget(isClircle: true);
      },
    );
  }
}
