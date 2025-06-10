import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'reminder_state.dart';

class ReminderCubit extends Cubit<ReminderState> {
  ReminderCubit() : super(ReminderInitial());

  bool isReminderOn = false;
  void toggleReminderSwitch({required bool isOn}) {
    isReminderOn = isOn;
    emit(ReminderSwitchClicked());
  }

  // always use savedReminderHour and savedReminderMinute to get the saved reminder time
  // because reminderHour and reminderMinute are used to change the values in the UI
  // and they are not saved until saveReminderTime() is called
  int reminderHour = 0;
  int savedReminderHour = 0;
  int reminderMinute = 0;
  int savedReminderMinute = 0;
  void changeReminderHour({required int hour}) {
    reminderHour = hour;
    emit(ReminderHourChanged());
  }

  void changeReminderMinute({required int minute}) {
    reminderMinute = minute;
    emit(ReminderMinuteChanged());
  }

  void saveReminderTime() {
    savedReminderHour = reminderHour;
    savedReminderMinute = reminderMinute;
    emit(ReminderTimeSaved());
  }
}
