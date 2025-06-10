import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart' show Components;
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type_cubit/goal_type_cubit.dart';

class DurationLabeledActionButton extends StatelessWidget {
  const DurationLabeledActionButton({super.key, required this.goalTypeState});

  final GoalTypeState goalTypeState;

  @override
  Widget build(BuildContext context) {
    GoalTypeCubit goalTypeCubit = context.read<GoalTypeCubit>();
    return LabeledActionButton(
      labelText: 'Duration',
      sublabelText:
          '${goalTypeCubit.savedGoalHours}h ${goalTypeCubit.savedGoalMinutes}m',
      onPressed: () async {
        await _buildDefaultBottomSheet(context, goalTypeCubit).then((value) {
          // Handle the result of the bottom sheet to save the data only if the user presses save

          if (value == 'saved') {
            // method to emit the state to save the goal time data
            goalTypeCubit.saveGoalTime();
          }
        });
      },
    );
  }

  Future<dynamic> _buildDefaultBottomSheet(
    BuildContext context,
    GoalTypeCubit goalTypeCubit,
  ) {
    return Components.showDefaultBottomSheet(
      context,
      child: BlocProvider.value(
        value: goalTypeCubit,
        child: BuildBottomSheet(
          titleText: 'Choose the goal time',
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // hours picker
              Column(
                children: [
                  Text(
                    'hours',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  // Using BlocBuilder to rebuild only when goal hours change
                  _buildHoursPicker(goalTypeCubit),
                ],
              ),
              // minutes picker
              Column(
                children: [
                  Text(
                    'minutes',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  // Using BlocBuilder to rebuild only when goal minutes change
                  _buildMinutesPicker(goalTypeCubit),
                ],
              ),
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

  BlocBuilder<GoalTypeCubit, GoalTypeState> _buildMinutesPicker(
    GoalTypeCubit goalTypeCubit,
  ) {
    return BlocBuilder<GoalTypeCubit, GoalTypeState>(
      buildWhen:
          (previous, current) =>
              goalTypeState is GoalMinutesChanged ||
              previous is GoalMinutesChanged,
      builder: (context, state) {
        return Expanded(
          child: DefaultNumberPicker(
            minValue: 0,
            maxValue: 59,
            value: goalTypeCubit.goalMinutes,
            onChanged: (value) {
              goalTypeCubit.changeGoalMinutes(minutes: value);
            },
          ),
        );
      },
    );
  }

  BlocBuilder<GoalTypeCubit, GoalTypeState> _buildHoursPicker(
    GoalTypeCubit goalTypeCubit,
  ) {
    return BlocBuilder<GoalTypeCubit, GoalTypeState>(
      buildWhen:
          (previous, current) =>
              goalTypeState is GoalHoursChanged || previous is GoalHoursChanged,
      builder: (context, state) {
        return Expanded(
          child: DefaultNumberPicker(
            minValue: 0,
            maxValue: 23,
            value: goalTypeCubit.goalHours,
            onChanged: (value) {
              goalTypeCubit.changeGoalHours(hours: value);
            },
          ),
        );
      },
    );
  }
}
