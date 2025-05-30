import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:numberpicker/numberpicker.dart';

class DefaultNumberPicker extends StatelessWidget {
  const DefaultNumberPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.value,
    this.infiniteLoop = true,
    this.zeroPad = true,
  });
  final int minValue;
  final int maxValue;
  final Function(int value) onChanged;
  final int value;
  final bool infiniteLoop;
  final bool zeroPad;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      itemCount: 5,
      minValue: minValue,
      maxValue: maxValue,
      zeroPad: zeroPad,
      infiniteLoop: infiniteLoop,
      selectedTextStyle: Theme.of(
        context,
      ).textTheme.displayLarge!.copyWith(color: AppColors.lightGrey),
      textStyle: Theme.of(
        context,
      ).textTheme.displayLarge!.copyWith(color: AppColors.grey),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.darkOrange),
          top: BorderSide(color: AppColors.darkOrange),
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
