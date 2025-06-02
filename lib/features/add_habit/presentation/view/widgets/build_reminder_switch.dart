import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/add_habit_cubit/add_habit_cubit.dart';

class BuildReminderSwitch extends StatelessWidget {
  const BuildReminderSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHabitCubit, AddHabitState>(
      builder: (context, state) {
        return LabeledActionButton(
          onPressed: null,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
          labelText: 'Reminder for Habit',
          suffix: Transform.scale(
            scale: 0.7,
            child: Switch(
              activeColor: AppColors.darkOrange,
              // get the value from the state
              value:
                  state is ReminderSwitchClicked ? state.isReminderOn : false,
              onChanged: (value) {
                // toggle the switch and emit the state
                context.read<AddHabitCubit>().toggleReminderSwitch(isOn: value);
              },
            ),
          ),

          iconColor: AppColors.darkOrange,
        );
      },
    );
  }
}
