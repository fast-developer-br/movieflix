import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieflix/shared/colors/app_colors.dart';
import 'package:sizer/sizer.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppColors.themeDark,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.themeDark),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(color: AppColors.white, fontSize: 18.sp),
    titleMedium: GoogleFonts.poppins(color: AppColors.white, fontSize: 15.sp),
    titleSmall: GoogleFonts.poppins(color: AppColors.white, fontSize: 13.sp),
    bodyMedium: GoogleFonts.poppins(color: AppColors.white, fontSize: 12.sp),
    bodySmall: GoogleFonts.poppins(color: AppColors.white, fontSize: 10.sp),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.themeDark,
      selectedIconTheme: IconThemeData(color: Colors.white, size: 4.h),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 3.h)),
);
