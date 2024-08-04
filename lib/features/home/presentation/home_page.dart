import 'package:flutter/material.dart';
import 'package:movieflix/features/home/presentation/widgets/popular/popular_movies_widget.dart';
import 'package:movieflix/features/home/presentation/widgets/upcoming_carousel/upcoming_carousel_widget.dart';
import 'package:sizer/sizer.dart';

import 'widgets/top_rated/top_rated_movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      const UpcomingCarouselWidget(),
      const TopRatedMoviesWidget(),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: const PopularMoviesWidget(),
      )
    ]));
  }
}
