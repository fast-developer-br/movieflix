import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/core/network/api_consts.dart';
import 'package:movieflix/features/home/presentation/cubits/upcoming/carousel/upcoming_carousel_cubit.dart';
import 'package:movieflix/shared/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../../shared/widgets/images/images_network_widget.dart';
import '../../../../../shared/widgets/shimmer/shimmer_card.dart';
import '../../cubits/upcoming/movies/upcoming_movies_cubit.dart';

class UpcomingCarouselWidget extends StatefulWidget {
  const UpcomingCarouselWidget({super.key});

  @override
  State<UpcomingCarouselWidget> createState() => _UpcomingCarouselWidgetState();
}

class _UpcomingCarouselWidgetState extends State<UpcomingCarouselWidget> {
  late CarouselController _carouselController;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    Modular.get<UpcomingMoviesCubit>().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      bloc: Modular.get<UpcomingMoviesCubit>(),
      builder: (context, state) {
        if (state is UpcomingMoviesSuccess) {
          final response = state.response;
          response.results.removeRange(4, response.results.length - 1);

          return BlocBuilder<UpcomingCarouselCubit, UpcomingCarouselState>(
            bloc: Modular.get<UpcomingCarouselCubit>(),
            builder: (context, state) {
              _current = state.currentIndex;

              return Column(
                children: [
                  CarouselSlider.builder(
                      carouselController: _carouselController,
                      itemCount: response.results.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = response.results[index];

                        return ImagesNetworkWidget(
                            imageUrl:
                                '${ApiConsts.imageBaseURL}${movie.backdropPath}',
                            radius: 15);
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) async =>
                            await Modular.get<UpcomingCarouselCubit>()
                                .setIndex(index),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: response.results.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () async {
                          _carouselController.animateToPage(entry.key);
                        },
                        child: Container(
                          width: _current == entry.key ? 4.h : 1.h,
                          height: 1.h,
                          margin: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: .7.h),
                          decoration: BoxDecoration(
                              shape: _current == entry.key
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              borderRadius: _current == entry.key
                                  ? BorderRadius.circular(10)
                                  : null,
                              color: AppColors.white.withOpacity(
                                  _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  )
                ],
              );
            },
          );
        }
        return ShimmerCard(index: 1, height: 2.5.h);
      },
    );
  }
}
