import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';

class HabitModel {
  final int id;
  final String name;
  final String? content;
  final IconData icon;
  final Color color;
  final DateTime time;
  final DateTime? timeOfRemind;
  final DateTime? endDate;

  HabitModel({
    required this.id,
    required this.name,
    this.content,
    this.icon = Icons.alarm,
    this.color = AppColors.lightOrange,
    required this.time,
    this.timeOfRemind,
    this.endDate,
  });

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      id: json[AppStrings.id],
      name: json[AppStrings.name],
      content: json[AppStrings.content],

      // convert string from the database to IconData
      icon: Components.stringToIconData(json[AppStrings.icon]),
      color: Color(json[AppStrings.color]),
      time: DateTime.parse(json[AppStrings.time]),
      timeOfRemind: DateTime.tryParse(json[AppStrings.timeOfRemind]),
      endDate: DateTime.tryParse(json[AppStrings.endDate]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppStrings.name: name,
      AppStrings.icon: icon,
      AppStrings.content: content,

      // returns the value if the color(32 bits) to store in the database
      AppStrings.color: color.toARGB32(),
      AppStrings.time: time.toIso8601String(),
      AppStrings.timeOfRemind: timeOfRemind?.toIso8601String(),
      AppStrings.endDate: endDate?.toIso8601String(),
    };
  }
}
