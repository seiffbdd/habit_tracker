import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/core/widgets/gredient_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_date_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_goal_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_reminder_switch.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_tab_bar.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_number_picker.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/ends_on_after_x_days.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/goal_type_card.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/habit_time_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/custom_text_form_field.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/icon_and_color_card.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/reminder_time_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/weakday_selector.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/ends_on_cubit/ends_on_cubit.dart';

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

  @override
  Widget build(BuildContext context) {
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
              const HabitTimeButton(),
              height16,
              Text(
                'Daily Goal',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,
              const BuildGoalButton(),
              const GoalTypeCard(),
              height16,
              Text(
                'Remineder',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,

              const BuildReminderSwitch(),
              const ReminderTimeButton(),
              height16,
              Text('Ends On', style: Theme.of(context).textTheme.displayMedium),
              height8,
              BuildTabBar(tabController: _tabController, tabs: _endsOntabs),
              SizedBox(
                height: 80.h,
                child: TabBarView(
                  controller: _tabController,

                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox.shrink(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BuildDatePicker(),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: EndsOnAfterXDays(),
                    ),
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
