import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/reminder_cubit/reminder_cubit.dart';

class ReminderTimeButton extends StatelessWidget {
  const ReminderTimeButton({super.key});

  @override
  Widget build(BuildContext context) {
    ReminderCubit addHabitCubit = context.read<ReminderCubit>();
    // build to check if the reminder is on
    // if on, show the button with the saved time
    // if off, show nothing
    return BlocBuilder<ReminderCubit, ReminderState>(
      builder: (context, state) {
        if (addHabitCubit.isReminderOn) {
          return LabeledActionButton(
            sublabelText:
                '${addHabitCubit.savedReminderHour.toString().padLeft(2, '0')}:${addHabitCubit.savedReminderMinute.toString().padLeft(2, '0')}',
            labelText: 'Reminder Time',
            onPressed: () async {
              await _showDefaultBottomSheet(context, addHabitCubit).then((
                value,
              ) {
                if (value == 'saved') {
                  // method to emit the state to save the reminder time
                  addHabitCubit.saveReminderTime();
                }
              });
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Future<dynamic> _showDefaultBottomSheet(
    BuildContext context,
    ReminderCubit addHabitCubit,
  ) {
    return Components.showDefaultBottomSheet(
      context,
      child: BlocProvider.value(
        value: addHabitCubit,
        child: BuildBottomSheet(
          titleText: 'Choose the time',
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHoursPicker(addHabitCubit),
              _buildMinutesPicker(addHabitCubit),
            ],
          ),
          footer: GredientButton(
            text: 'Save',
            onPressed: () {
              context.pop('saved');
            },
          ),
        ),
      ),
    );
  }

  BlocBuilder<ReminderCubit, ReminderState> _buildHoursPicker(
    ReminderCubit addHabitCubit,
  ) {
    // BlocBuilder to rebuild the widget when the hour is scrolled
    return BlocBuilder<ReminderCubit, ReminderState>(
      buildWhen: (previous, current) => current is HourScrolled,
      builder: (context, state) {
        return DefaultNumberPicker(
          minValue: 0,
          maxValue: 23,
          value: addHabitCubit.reminderHour,
          onChanged: (value) {
            addHabitCubit.changeReminderHour(hour: value);
          },
        );
      },
    );
  }

  BlocBuilder<ReminderCubit, ReminderState> _buildMinutesPicker(
    ReminderCubit addHabitCubit,
  ) {
    // BlocBuilder to rebuild the widget when the minute is scrolled
    return BlocBuilder<ReminderCubit, ReminderState>(
      buildWhen: (previous, current) => current is MinuteScrolled,
      builder: (context, state) {
        return DefaultNumberPicker(
          minValue: 0,
          maxValue: 59,
          value: addHabitCubit.reminderMinute,
          onChanged: (value) {
            addHabitCubit.changeReminderMinute(minute: value);
          },
        );
      },
    );
  }
}
