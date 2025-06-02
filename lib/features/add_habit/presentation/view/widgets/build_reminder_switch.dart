import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/reminder_cubit/reminder_cubit.dart';

class BuildReminderSwitch extends StatelessWidget {
  const BuildReminderSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReminderCubit, ReminderState>(
      buildWhen: (previous, current) => current is ReminderSwitchClicked,
      builder: (context, state) {
        return LabeledActionButton(
          onPressed: null,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
          labelText: 'Reminder for Habit',
          suffix: Transform.scale(scale: 0.7, child: _buildSwitch(context)),

          iconColor: AppColors.darkOrange,
        );
      },
    );
  }

  Switch _buildSwitch(BuildContext context) {
    return Switch(
      activeColor: AppColors.darkOrange,
      // get the value from the state
      value: context.watch<ReminderCubit>().isReminderOn,
      onChanged: (value) {
        // toggle the switch and emit the state
        context.read<ReminderCubit>().toggleReminderSwitch(isOn: value);
      },
    );
  }
}
