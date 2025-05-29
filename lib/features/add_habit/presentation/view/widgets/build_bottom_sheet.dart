import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class BuildBottomSheet extends StatefulWidget {
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
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title widget or text
          Expanded(
            child:
                widget.title ??
                Text(
                  widget.titleText ?? '',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
          ),

          // body of the bottom sheet
          Expanded(flex: 6, child: widget.body ?? const SizedBox.shrink()),
          height12,
          // footer of the bottom sheet
          if (widget.footer != null)
            SizedBox(
              width: double.infinity,
              height: 49.h,
              child: widget.footer!,
            ),
        ],
      ),
    );
  }
}
