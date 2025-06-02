import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class WeekdaySelector extends StatefulWidget {
  const WeekdaySelector({super.key});

  @override
  State<WeekdaySelector> createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  List<bool> selectedDays = List.generate(7, (_) => true);

  final List<String> dayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Days of the week title
          Text(
            'Everyday',
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: AppColors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          height16,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return GestureDetector(
                onTap: () {
                  // i will handle it with cubit
                  setState(() {
                    selectedDays[index] = !selectedDays[index];
                  });
                },
                child: Container(
                  width: 40.h,
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selectedDays[index]
                            ? AppColors.darkOrange
                            : AppColors.grey,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    dayLabels[index],
                    style: const TextStyle(
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
