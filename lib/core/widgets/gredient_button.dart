import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class GredientButton extends StatelessWidget {
  const GredientButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          gradient: LinearGradient(
            colors: [
              AppColors.lightOrange,
              AppColors.darkOrange,
            ], // light to deep orange
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(color: AppColors.offWhite),
        ),
      ),
    );
  }
}
