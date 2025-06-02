import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/data/model/goal_type.dart';
import 'package:meta/meta.dart';

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

  // always use savedGoalHours and savedGoalMinutes to get the saved goal time
  // because goalHours and goalMinutes are used to change the values in the UI
  // and they are not saved until saveGoalTime() is called
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

  // always use savedGoalReps to get the saved goal reps
  // because goalReps is used to change the values in the UI
  // and it is not saved until saveGoalReps() is called
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
