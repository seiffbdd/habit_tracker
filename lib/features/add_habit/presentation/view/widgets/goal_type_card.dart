import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/data/model/goal_type.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type/goal_type_cubit.dart';

class GoalTypeCard extends StatelessWidget {
  const GoalTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    GoalTypeCubit goalTypeCubit = context.read<GoalTypeCubit>();
    return BlocBuilder<GoalTypeCubit, GoalTypeState>(
      buildWhen:
          (previous, current) =>
              current is GoalTypeChanged ||
              previous is GoalTypeChanged ||
              current is GoalDataSaved ||
              previous is GoalDataSaved,

      builder: (context, state) {
        if (goalTypeCubit.goalType == GoalType.duration) {
          return _durationLabeledActionButton(goalTypeCubit, context, state);
        } else if (goalTypeCubit.goalType == GoalType.repeats) {
          return _repsLabeledActionButton(goalTypeCubit, context, state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  LabeledActionButton _repsLabeledActionButton(
    GoalTypeCubit goalTypeCubit,
    BuildContext context,
    GoalTypeState state,
  ) {
    return LabeledActionButton(
      labelText: 'Reps',
      sublabelText: '${goalTypeCubit.savedGoalReps} reps',
      onPressed: () async {
        await Components.showDefaultBottomSheet(
          context,
          child: BlocProvider.value(
            value: goalTypeCubit,
            child: BuildBottomSheet(
              titleText: 'Choose the goal repeats',
              body: BlocBuilder<GoalTypeCubit, GoalTypeState>(
                buildWhen:
                    (previous, current) =>
                        state is GoalRepsChanged || previous is GoalRepsChanged,
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: DefaultNumberPicker(
                      minValue: 2,
                      maxValue: 1000,
                      infiniteLoop: false,
                      zeroPad: false,
                      value: goalTypeCubit.goalReps,
                      onChanged: (value) {
                        goalTypeCubit.changeGoalReps(reps: value);
                      },
                    ),
                  );
                },
              ),
              footer: GredientButton(
                text: 'Save',
                onPressed: () {
                  context.pop('saved');
                },
              ),
            ),
          ),
        ).then((value) {
          // Handle the result of the bottom sheet to save the data only if the user presses save
          if (value == 'saved') {
            // method to emit the state to save the goal data
            goalTypeCubit.saveGoalReps();
          }
        });
      },
    );
  }

  LabeledActionButton _durationLabeledActionButton(
    GoalTypeCubit goalTypeCubit,
    BuildContext context,
    GoalTypeState state,
  ) {
    return LabeledActionButton(
      labelText: 'Duration',
      sublabelText:
          '${goalTypeCubit.savedGoalHours}h ${goalTypeCubit.savedGoalMinutes}m',
      onPressed: () async {
        await Components.showDefaultBottomSheet(
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
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: AppColors.lightGrey),
                      ),
                      // Using BlocBuilder to rebuild only when goal hours change
                      BlocBuilder<GoalTypeCubit, GoalTypeState>(
                        buildWhen:
                            (previous, current) =>
                                state is GoalHoursChanged ||
                                previous is GoalHoursChanged,
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
                      ),
                    ],
                  ),
                  // minutes picker
                  Column(
                    children: [
                      Text(
                        'minutes',
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: AppColors.lightGrey),
                      ),
                      // Using BlocBuilder to rebuild only when goal minutes change
                      BlocBuilder<GoalTypeCubit, GoalTypeState>(
                        buildWhen:
                            (previous, current) =>
                                state is GoalMinutesChanged ||
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
                      ),
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
        ).then((value) {
          // Handle the result of the bottom sheet to save the data only if the user presses save

          if (value == 'saved') {
            // method to emit the state to save the goal time data
            goalTypeCubit.saveGoalTime();
          }
        });
      },
    );
  }
}
