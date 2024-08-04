import 'package:flutter/material.dart';
import 'package:movieflix/shared/widgets/shimmer/shimmer_card.dart';
import 'package:sizer/sizer.dart';

class HorizontalShimmerListWidget extends StatelessWidget {
  final bool isClircle;
  const HorizontalShimmerListWidget({super.key, this.isClircle = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: ShimmerCard(
              index: 1,
              height: 3.h,
              width: 8.w,
              circle: isClircle,
            ),
          );
        },
      ),
    );
  }
}
