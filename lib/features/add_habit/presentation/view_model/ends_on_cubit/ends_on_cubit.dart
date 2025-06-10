import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ends_on_state.dart';

class EndsOnCubit extends Cubit<EndsOnState> {
  EndsOnCubit() : super(EndsOnInitial());

  void saveEndDate({required DateTime date}) {
    emit(EndDatePicked(date: date));
  }

  int days = 2;
  int savedDays = 2;

  void changeDaysNumber({required int days}) {
    this.days = days;
    emit(DaysNumberPicked());
  }

  void saveDaysNumber() {
    savedDays = days;
    emit(DaysNumberSaved());
  }
}
