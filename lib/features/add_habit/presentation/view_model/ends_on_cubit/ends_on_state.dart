part of 'ends_on_cubit.dart';

@immutable
sealed class EndsOnState {}

final class EndsOnInitial extends EndsOnState {}

final class EndDatePicked extends EndsOnState {
  final DateTime date;

  EndDatePicked({required this.date});
}

final class DaysNumberPicked extends EndsOnState {}

final class DaysNumberSaved extends EndsOnState {}
