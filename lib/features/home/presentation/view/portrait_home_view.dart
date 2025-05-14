import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/core/global/ui_constants.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/completed_habits_percentage.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/custom_floating_action_button.dart';

import 'package:habit_tracker/features/home/presentation/view/widgets/tasks_sliver_list.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/text_and_text_button_row.dart'
    show TextAndTextButtonRow;

class PortraitHomeView extends StatelessWidget {
  const PortraitHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),

      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 40.h, 12.w, 12.w),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  'Sun, 1 March 2022',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                height12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ',
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: Text(
                        'Susy!',
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: AppColors.darkOrange),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                height16,
                CompletedHabitsPercentage(),
                height12,
                TextAndTextButtonRow(),
              ]),
            ),
            // Task list using SliverList
            TasksSliverList(),
          ],
        ),
      ),
    );
  }
}
