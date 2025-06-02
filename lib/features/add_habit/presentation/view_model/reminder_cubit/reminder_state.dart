part of 'reminder_cubit.dart';

@immutable
sealed class ReminderState {}

final class ReminderInitial extends ReminderState {}

final class ReminderSwitchClicked extends ReminderState {}

final class HourScrolled extends ReminderState {}

final class MinuteScrolled extends ReminderState {}

final class ReminderTimeSaved extends ReminderState {
  ReminderTimeSaved();
}
