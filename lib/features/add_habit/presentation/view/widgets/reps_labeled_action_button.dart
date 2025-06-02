import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type/goal_type_cubit.dart';

class RepsLabeledActionButton extends StatelessWidget {
  const RepsLabeledActionButton({super.key, required this.goalTypeState});

  final GoalTypeState goalTypeState;

  @override
  Widget build(BuildContext context) {
    GoalTypeCubit goalTypeCubit = context.read<GoalTypeCubit>();
    return LabeledActionButton(
      labelText: 'Reps',
      sublabelText: '${goalTypeCubit.savedGoalReps} reps',
      onPressed: () async {
        await _buildDefaultBottomSheet(context, goalTypeCubit).then((value) {
          // Handle the result of the bottom sheet to save the data only if the user presses save
          if (value == 'saved') {
            // method to emit the state to save the goal data
            goalTypeCubit.saveGoalReps();
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
          titleText: 'Choose the goal repeats',
          body: BlocBuilder<GoalTypeCubit, GoalTypeState>(
            buildWhen:
                (previous, current) =>
                    goalTypeState is GoalRepsChanged ||
                    previous is GoalRepsChanged,
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
    );
  }
}
