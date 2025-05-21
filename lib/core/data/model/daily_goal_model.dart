import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/data/model/goal_type.dart';

class DailyGoalModel {
  final int id;
  final GoalType goalType; // off, duration, or repeats
  final int? durationSecs;
  final int? reps;
  final int habitID;

  DailyGoalModel({
    required this.id,
    this.goalType = GoalType.off,
    this.durationSecs,
    this.reps,
    required this.habitID,
  });

  factory DailyGoalModel.fromJson(Map<String, dynamic> json) {
    return DailyGoalModel(
      id: json[AppStrings.id],
      goalType: GoalType.values.byName(json[AppStrings.goalType]),
      durationSecs: json[AppStrings.durationSecs],
      reps: json[AppStrings.reps],
      habitID: json[AppStrings.habitID],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      AppStrings.id: id,
      AppStrings.goalType: goalType.name,
      AppStrings.durationSecs: durationSecs,
      AppStrings.reps: reps,
      AppStrings.habitID: habitID,
    };
  }
}
