import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/core/global/ui_constants.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/completed_habits_percentage.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/custom_floating_action_button.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/tasks_sliver_list.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/text_and_text_button_row.dart';

class LandscapeHomeView extends StatelessWidget {
  const LandscapeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),

      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          children: [
            /// Left Panel — Greeting and Progress
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sun, 1 March 2022',
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
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
                    height24,
                    const CompletedHabitsPercentage(),
                  ],
                ),
              ),
            ),

            /// Separator
            Expanded(child: const SizedBox()),

            /// Right Panel — Habits and Tasks
            Expanded(
              flex: 6,
              child: CustomScrollView(
                slivers: [
                  /// Header Row
                  SliverList(
                    delegate: SliverChildListDelegate([
                      TextAndTextButtonRow(),
                      height12,
                    ]),
                  ),
                  TasksSliverList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
