import 'package:flutter/material.dart';
import 'package:movieflix/shared/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class CircularRatingWidget extends StatelessWidget {
  final int rating;
  const CircularRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(.5.h),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.backgroundRating),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 3,
              value: rating / 100,
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.getRatingColorPrimary(rating)),
              backgroundColor:
                  AppColors.getRatingColorPrimary(rating).withOpacity(.2),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rating != 0 ? rating.toString() : 'NR',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(top: .2.h),
                  child: Text('%',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 5.sp, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ));
  }
}
