import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(62.0.h),
      ),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(4.0.h),
        child: Container(
          height: 51.67.h,
          width: 51.67.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.darkGreen,
          ),

          child: Icon(Icons.add, color: AppColors.white, size: 40.h),
        ),
      ),
    );
  }
}
