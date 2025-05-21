import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/home/data/model/task_model.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/task_card.dart';

class TasksSliverList extends StatelessWidget {
  const TasksSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return Row(
          children: [
            Expanded(
              child: Transform.scale(
                scale: 1.5.h,
                child: Checkbox(
                  value: true,
                  activeColor: AppColors.darkGreen,
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
                  subtitle: 'Today',
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
