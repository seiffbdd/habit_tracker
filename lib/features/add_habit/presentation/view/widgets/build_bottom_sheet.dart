import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    this.title,
    this.titleText,
    this.footer,
    this.body,
  });
  final Widget? title;
  final String? titleText;
  final Widget? body;
  final Widget? footer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title widget or text
            Expanded(
              child:
                  title ??
                  Text(
                    titleText ?? '',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
            ),

            // body of the bottom sheet
            Expanded(flex: 6, child: body ?? SizedBox.shrink()),
            // footer of the bottom sheet
            if (footer != null)
              SizedBox(width: double.infinity, height: 49.h, child: footer!),
          ],
        ),
      ),
    );
  }
}
