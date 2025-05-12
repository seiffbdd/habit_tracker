import 'package:flutter/widgets.dart';

class TaskModel {
  String title;
  IconData icon;
  Color color;
  String? subtitle;
  int? minutes;
  int? reps;
  bool isDone;
  TaskModel({
    required this.title,
    required this.icon,
    required this.color,
    this.subtitle,
    this.minutes,
    this.reps,
    this.isDone = true,
  });
}
