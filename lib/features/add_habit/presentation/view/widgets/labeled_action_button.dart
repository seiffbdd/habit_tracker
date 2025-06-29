import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class LabeledActionButton extends StatelessWidget {
  const LabeledActionButton({
    super.key,
    required this.labelText,
    this.suffixIcon,

    this.onPressed,
    this.sublabel,
    this.sublabelText,
    this.disabledBorder = false,
    this.iconColor,
    this.suffix,
    this.padding,
  });
  final String labelText;
  final Widget? sublabel;
  final String? sublabelText;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final bool disabledBorder;
  final Color? iconColor;
  final Widget? suffix;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(labelText, style: Theme.of(context).textTheme.displayLarge),
          if (sublabelText != null)
            Text(
              sublabelText!,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(color: AppColors.grey),
            ),
          if (sublabel != null && sublabelText == null) sublabel!,
        ],
      ),

      icon:
          suffix ??
          Icon(
            suffixIcon ?? Icons.arrow_forward_ios,
            color: iconColor ?? AppColors.grey,
          ),
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        elevation: disabledBorder ? 0 : null,

        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.h, vertical: 24.h),
      ),
    );
  }
}
