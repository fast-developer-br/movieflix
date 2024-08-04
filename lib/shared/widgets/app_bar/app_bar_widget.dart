import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieflix/shared/assets/app_assets.dart';
import 'package:movieflix/shared/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Image.asset(
          AppAssets.movieflix,
          width: 40.w,
        ),
        leading: Visibility(
          visible: Navigator.of(context).canPop(),
          child: IconButton(
            onPressed: () => Modular.to.pop(),
            icon: Icon(
              Icons.arrow_back,
              size: 3.h,
              color: AppColors.white,
            ),
          ),
        ));
  }
}
