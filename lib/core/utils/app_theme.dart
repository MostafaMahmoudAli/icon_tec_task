import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: TextTheme(
      headlineLarge:  TextStyle(
        fontSize: 20.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w800,
      ),
      displayLarge: TextStyle(
        fontSize: 20.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w800,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        fontSize: 16.sp,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
