import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';

class CompletedHabitsPercentage extends StatelessWidget {
  const CompletedHabitsPercentage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 189.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0.r),
              image: DecorationImage(
                image: AssetImage('assets/images/Group 136.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 117.41.h,
                        width: 177.41.w,
                        child: Image.asset('assets/images/Group.png'),
                      ),
                      Text(
                        '70%',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '3 of 5 habits',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        'completed today!',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset('assets/images/Calendar_Flatline 1.png'),
          ),
        ],
      ),
    );
  }
}
