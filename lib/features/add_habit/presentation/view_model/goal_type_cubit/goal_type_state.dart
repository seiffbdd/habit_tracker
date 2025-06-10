part of 'goal_type_cubit.dart';

@immutable
sealed class GoalTypeState {}

final class GoalTypeInitial extends GoalTypeState {}

final class GoalTypeChanged extends GoalTypeState {}

final class GoalHoursChanged extends GoalTypeState {}

final class GoalMinutesChanged extends GoalTypeState {}

final class GoalRepsChanged extends GoalTypeState {}

final class GoalDataSaved extends GoalTypeState {}
