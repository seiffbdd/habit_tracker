import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';

ThemeData get themeData {
  return ThemeData(
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(color: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.lightOrange),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(AppColors.darkGreen),
    ),
  );
}

TextTheme get textTheme {
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.blackGrey,
    ),
    headlineMedium: TextStyle(
      fontSize: 21.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.blackGrey,
    ),
    displayLarge: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
    displayMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
    displaySmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
  );
}
