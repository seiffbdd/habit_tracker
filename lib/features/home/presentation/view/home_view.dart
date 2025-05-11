import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/core/global/ui_constants.dart';
import 'package:habit_tracker/features/home/data/model/task_card_model.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/completed_habits_percentage.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/task_card.dart'
    show TaskCard;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(min(12.w, 16.0)),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                height40,
                Text(
                  'Sun, 1 March 2022',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                height12,
                Row(
                  children: [
                    Text(
                      'Hello, ',
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Susy!',
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(color: AppColors.darkOrange),
                    ),
                  ],
                ),
                height16,
                CompletedHabitsPercentage(),
                height12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today Habits',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),

          // Task list using SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Transform.scale(
                        scale: 1.7.w,
                        child: Checkbox(
                          value: true,
                          activeColor: AppColors.darkGreen,
                          focusNode: FocusNode(),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: TaskCard(
                        taskModel: TaskModel(
                          title: 'Clean as you go',
                          icon: Icons.face,
                          color: AppColors.lightOrange,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
