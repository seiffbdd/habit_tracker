import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/data/model/day.dart';

class RepeatDayModel {
  final Day day;
  final int habitID;

  RepeatDayModel({required this.day, required this.habitID});

  factory RepeatDayModel.fromJson(Map<String, dynamic> json) {
    return RepeatDayModel(
      day: Day.values.byName(json[AppStrings.day]),
      habitID: json[AppStrings.habitID],
    );
  }

  Map<String, dynamic> toJSon() {
    return {AppStrings.day: day.name, AppStrings.habitID: habitID};
  }
}
