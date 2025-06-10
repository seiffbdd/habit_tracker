import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type_cubit/goal_type_cubit.dart';

class BuildGoalButton extends StatelessWidget {
  const BuildGoalButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalTypeCubit, GoalTypeState>(
      buildWhen:
          (previous, current) =>
              current is GoalTypeChanged || previous is GoalTypeChanged,
      builder: (context, state) {
        return LabeledActionButton(
          labelText: 'Goal',
          sublabelText: context.read<GoalTypeCubit>().goalType.name,
          onPressed: () {
            context.read<GoalTypeCubit>().changeGoalType();
          },
          disabledBorder: true,
        );
      },
    );
  }
}
