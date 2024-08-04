import 'package:flutter/material.dart';
import 'package:movieflix/shared/assets/app_assets.dart';
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
    ));
  }
}
