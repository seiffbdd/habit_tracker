import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/ends_on_cubit/ends_on_cubit.dart';

class EndsOnAfterXDays extends StatelessWidget {
  const EndsOnAfterXDays({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndsOnCubit, EndsOnState>(
      buildWhen: (previous, current) => current is DaysNumberSaved,
      builder: (context, state) {
        return LabeledActionButton(
          labelText: 'After X days',
          sublabelText: '${context.read<EndsOnCubit>().savedDays}',
          onPressed: () async {
            await Components.showDefaultBottomSheet(
              context,
              child: BlocProvider.value(
                value: context.read<EndsOnCubit>(),
                child: BuildBottomSheet(
                  titleText: 'Days',
                  body: Center(
                    child: BlocBuilder<EndsOnCubit, EndsOnState>(
                      buildWhen:
                          (previous, current) => current is DaysNumberPicked,
                      builder: (context, state) {
                        return DefaultNumberPicker(
                          minValue: 2,
                          maxValue: 150,
                          zeroPad: false,
                          onChanged: (value) {
                            context.read<EndsOnCubit>().changeDaysNumber(
                              days: value,
                            );
                          },
                          value: context.read<EndsOnCubit>().days,
                        );
                      },
                    ),
                  ),
                  footer: GredientButton(
                    text: 'Save',
                    onPressed: () {
                      context.pop('saved');
                    },
                  ),
                ),
              ),
            ).then((value) {
              if (value == 'saved' && context.mounted) {
                context.read<EndsOnCubit>().saveDaysNumber();
              }
            });
          },
        );
      },
    );
  }
}
