import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/ends_on_cubit/ends_on_cubit.dart';

class BuildDatePicker extends StatelessWidget {
  const BuildDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndsOnCubit, EndsOnState>(
      buildWhen: (previous, current) => current is EndDatePicked,
      builder: (context, state) {
        return LabeledActionButton(
          labelText: 'Last Date',
          sublabelText:
              state is EndDatePicked
                  ? '${state.date.year.toString()}-${state.date.month.toString().padLeft(2, '0')}-${state.date.day.toString().padLeft(2, '0')}'
                  : '',
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2099),
              confirmText: 'Save',
              initialEntryMode: DatePickerEntryMode.calendarOnly,
            );
            if (pickedDate != null && context.mounted) {
              context.read<EndsOnCubit>().saveEndDate(date: pickedDate);
            }
          },
        );
      },
    );
  }
}
