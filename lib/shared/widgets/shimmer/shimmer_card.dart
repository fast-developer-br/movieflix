import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerCard extends StatelessWidget {
  final int index;
  final double height;
  final double width;
  const ShimmerCard(
      {super.key, required this.index, required this.height, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      height: height.h,
      width: width.w,
      child: Shimmer.fromColors(
        baseColor: colorForIndex(index, context) as Color,
        highlightColor: Colors.white38,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: colorForIndex(index, context),
          ),
        ),
      ),
    );
  }

  Color? colorForIndex(int index, BuildContext context) {
    Color? color = Colors.black87;
    if (index.floor().isEven) {
      color = Colors.black87;
    } else {
      color = Colors.black38;
    }
    return color;
  }
}
