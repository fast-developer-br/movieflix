import 'package:flutter/material.dart';
import 'package:movieflix/shared/widgets/shimmer/shimmer_card.dart';
import 'package:sizer/sizer.dart';

class CardShimmerWidget extends StatelessWidget {
  final double? height;
  final int? itemCount;
  const CardShimmerWidget({super.key, this.height = 0, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.only(top: 1.h),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount ?? 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .6,
              crossAxisCount: 3,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            return ShimmerCard(index: index, height: 1.h);
          }),
    );
  }
}
