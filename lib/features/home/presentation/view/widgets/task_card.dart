import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/features/home/data/model/task_card_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, this.onTap});
  final TaskModel taskModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: taskModel.color,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 4.0),
        leading: Icon(taskModel.icon, size: 40.w, color: AppColors.white),
        title: Text(
          taskModel.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle:
            taskModel.subtitle == null
                ? null
                : Text(
                  taskModel.subtitle!,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(color: Colors.white70),
                ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz, color: AppColors.white),
        ),
      ),
    );
  }
}
