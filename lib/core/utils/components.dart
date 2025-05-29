import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

abstract class Components {
  static String iconDataToString(IconData iconData) {
    return '${iconData.codePoint}|${iconData.fontFamily ?? ''}|${iconData.fontPackage ?? ''}';
  }

  static IconData stringToIconData(String data) {
    final parts = data.split('|');
    final codePoint = int.parse(parts[0]);
    final fontFamily = parts[1].isEmpty ? null : parts[1];
    final fontPackage = parts[2].isEmpty ? null : parts[2];

    return IconData(
      codePoint,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
    );
  }

  static Future<dynamic> showDefaultBottomSheet(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: AppColors.blackGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),

      builder:
          (context) => SizedBox(
            height:
                ResponsiveLayout.isMobile(context)
                    ? MediaQuery.of(context).size.height * 0.5
                    : MediaQuery.of(context).size.height * .90,
            child: child,
          ),
    );
  }
}
