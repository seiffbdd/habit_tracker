import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/utils/app_router.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/completed_habits_percentage.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/custom_floating_action_button.dart';

import 'package:habit_tracker/features/home/presentation/view/widgets/tasks_sliver_list.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/text_and_text_button_row.dart'
    show TextAndTextButtonRow;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageStorageKey = PageStorageKey('scrollKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRouter.addHabitViewName);
        },
      ),

      body:
          ResponsiveLayout.isMobile(context)
              ? buildMobile(context)
              : buildTablet(context),
    );
  }

  Widget buildMobile(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
        child: CustomScrollView(
          key: _pageStorageKey,
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
                const CompletedHabitsPercentage(),
                height12,
                const TextAndTextButtonRow(),
              ]),
            ),
            // Task list using SliverList
            TasksSliverList(),
          ],
        ),
      ),
    );
  }

  Widget buildTablet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          /// Left Panel — Greeting and Progress
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  height24,
                  const CompletedHabitsPercentage(),
                ],
              ),
            ),
          ),

          /// Vertical Separator
          Expanded(child: const SizedBox()),

          /// Right Panel — Habits and Tasks
          Expanded(
            flex: 11,
            child: CustomScrollView(
              key: _pageStorageKey,
              slivers: [
                /// Header Row
                SliverList(
                  delegate: SliverChildListDelegate([
                    const TextAndTextButtonRow(),
                    height12,
                  ]),
                ),
                const TasksSliverList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
