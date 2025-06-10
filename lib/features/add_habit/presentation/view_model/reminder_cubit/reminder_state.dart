part of 'reminder_cubit.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

final class ReminderSwitchClicked extends ReminderState {}

final class ReminderHourChanged extends ReminderState {}

final class ReminderMinuteChanged extends ReminderState {}

final class ReminderTimeSaved extends ReminderState {
  ReminderTimeSaved();
}
