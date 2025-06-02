import 'package:flutter/material.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';

class HabitTimeButton extends StatefulWidget {
  const HabitTimeButton({super.key});

  @override
  State<HabitTimeButton> createState() => _HabitTimeButtonState();
}

class _HabitTimeButtonState extends State<HabitTimeButton> {
  final int _hour = 8; // Default hour
  final int _minute = 0; // Default minute
  @override
  Widget build(BuildContext context) {
    return LabeledActionButton(
      labelText: 'Habit Time',
      sublabelText: '08:00',
      onPressed: () async {
        await Components.showDefaultBottomSheet(
          context,
          child: StatefulBuilder(
            // i will handle it with cubit
            builder: (context, setState) {
              return BuildBottomSheet(
                titleText: 'Choose the time',
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultNumberPicker(
                      minValue: 0,
                      maxValue: 23,
                      value: _hour,
                      onChanged: (value) {},
                    ),
                    DefaultNumberPicker(
                      minValue: 0,
                      maxValue: 59,
                      value: _minute,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                footer: const GredientButton(text: 'Save'),
              );
            },
          ),
        );
      },
    );
  }
}
