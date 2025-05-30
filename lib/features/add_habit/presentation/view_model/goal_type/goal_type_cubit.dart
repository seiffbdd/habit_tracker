import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/data/model/goal_type.dart';

part 'goal_type_state.dart';

class GoalTypeCubit extends Cubit<GoalTypeState> {
  GoalTypeCubit() : super(GoalTypeInitial());

  GoalType goalType = GoalType.off;
  void changeGoalType() {
    if (goalType == GoalType.off) {
      goalType = GoalType.duration;
    } else if (goalType == GoalType.duration) {
      goalType = GoalType.repeats;
    } else if (goalType == GoalType.repeats) {
      goalType = GoalType.off;
    }
    emit(GoalTypeChanged());
  }

  int goalHours = 0;
  int goalMinutes = 0;
  int savedGoalHours = 0;
  int savedGoalMinutes = 0;
  void changeGoalHours({required int hours}) {
    goalHours = hours;
    emit(GoalHoursChanged());
  }

  void changeGoalMinutes({required int minutes}) {
    goalMinutes = minutes;
    emit(GoalMinutesChanged());
  }

  void saveGoalTime() {
    savedGoalHours = goalHours;
    savedGoalMinutes = goalMinutes;
    emit(GoalDataSaved());
  }

  int goalReps = 2;
  int savedGoalReps = 2;
  void changeGoalReps({required int reps}) {
    goalReps = reps;
    emit(GoalRepsChanged());
  }

  void saveGoalReps() {
    savedGoalReps = goalReps;
    emit(GoalDataSaved());
  }
}
