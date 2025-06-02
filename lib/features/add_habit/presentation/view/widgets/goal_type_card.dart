import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/data/model/goal_type.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/duration_labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/reps_labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type/goal_type_cubit.dart';

class GoalTypeCard extends StatelessWidget {
  const GoalTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    GoalTypeCubit goalTypeCubit = context.read<GoalTypeCubit>();
    return BlocBuilder<GoalTypeCubit, GoalTypeState>(
      buildWhen:
          (previous, current) =>
              current is GoalTypeChanged || current is GoalDataSaved,

      builder: (context, state) {
        if (goalTypeCubit.goalType == GoalType.duration) {
          return DurationLabeledActionButton(goalTypeState: state);
        } else if (goalTypeCubit.goalType == GoalType.repeats) {
          return RepsLabeledActionButton(goalTypeState: state);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
