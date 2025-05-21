import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/data/model/habit_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.habitModel});
  final HabitModel habitModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: habitModel.color,
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 4.0),
        leading: Icon(habitModel.icon, size: 40.h, color: AppColors.white),
        title: Text(
          habitModel.name,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle:
            habitModel.content == null
                ? null
                : Text(
                  habitModel.content!,
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
