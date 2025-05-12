import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';

ThemeData get appTheme {
  return ThemeData(
    textTheme: appTextTheme,
    appBarTheme: const AppBarTheme(color: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.darkOrange),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all<Color>(AppColors.darkGreen),
    ),
  );
}

TextTheme get appTextTheme {
  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 29.h,
      fontWeight: FontWeight.bold,
      color: AppColors.blackGrey,
    ),
    headlineMedium: TextStyle(
      fontSize: 21.h,
      fontWeight: FontWeight.bold,
      color: AppColors.blackGrey,
    ),
    displayLarge: TextStyle(
      fontSize: 18.h,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
    displayMedium: TextStyle(
      fontSize: 16.h,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
    displaySmall: TextStyle(
      fontSize: 14.h,
      fontWeight: FontWeight.w500,
      color: AppColors.blackGrey,
    ),
  );
}
