import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_tab_bar.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/goal_type_card.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/custom_text_form_field.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/icon_and_color_card.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/weakday_selector.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type/goal_type_cubit.dart';

class AddHabitView extends StatefulWidget {
  const AddHabitView({super.key});

  @override
  State<AddHabitView> createState() => _AddHabitViewState();
}

class _AddHabitViewState extends State<AddHabitView>
    with SingleTickerProviderStateMixin {
  late TextEditingController _habitNameController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _habitNameController = TextEditingController();
    _tabController = TabController(length: _endsOntabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _habitNameController.dispose();
    _tabController.dispose();
  }

  int _hour = 0;
  int _minute = 0;
  @override
  Widget build(BuildContext context) {
    GoalTypeCubit goalTypeCubit = context.read<GoalTypeCubit>();
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 12.0),
        title: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text('Create New Habit'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.lightGrey, height: 1.h),
              height20,
              CustomTextFormField(controller: _habitNameController),
              height20,
              const IconAndColorCard(),
              height16,
              Text('Repeat', style: Theme.of(context).textTheme.displayMedium),
              height8,
              const WeekdaySelector(),

              height16,
              Text(
                'Do It At',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,
              LabeledActionButton(
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
                                onChanged: (value) {
                                  setState(() {
                                    _hour = value;
                                  });
                                },
                              ),
                              DefaultNumberPicker(
                                minValue: 0,
                                maxValue: 59,
                                value: _minute,
                                onChanged: (value) {
                                  setState(() {
                                    _minute = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          footer: GredientButton(text: 'Save'),
                        );
                      },
                    ),
                  );
                },
              ),
              height16,
              Text(
                'Daily Goal',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,
              BlocBuilder<GoalTypeCubit, GoalTypeState>(
                buildWhen:
                    (previous, current) =>
                        current is GoalTypeChanged ||
                        previous is GoalTypeChanged,
                builder: (context, state) {
                  return LabeledActionButton(
                    labelText: 'Goal',
                    sublabelText: goalTypeCubit.goalType.name,
                    onPressed: () {
                      goalTypeCubit.changeGoalType();
                    },
                  );
                },
              ),
              GoalTypeCard(),
              height16,
              Text(
                'Remineder',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const LabeledActionButton(
                labelText: 'Reminder for Habit',
                suffixIcon: Icons.radio_button_checked,
                iconColor: AppColors.darkOrange,
              ),
              height16,
              Text('Ends On', style: Theme.of(context).textTheme.displayMedium),
              height8,
              BuildTabBar(tabController: _tabController, tabs: _endsOntabs),
              SizedBox(
                height: 200.h,
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const Center(child: Text('Off')),
                    const Center(child: Text('Date')),
                    const Center(child: Text('Days')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const List<Widget> _endsOntabs = [
    Tab(text: 'Off'),
    Tab(text: 'Date'),
    Tab(text: 'Days'),
  ];
}
