import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/constants/ui_constants.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_tab_bar.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/custom_text_form_field.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/icon_and_color_card.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        actionsPadding: EdgeInsets.only(right: 12.0.w),
        title: Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: Text('Create New Habit'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: AppColors.lightGrey, height: 1.h),
              height20,
              CustomTextFormField(controller: _habitNameController),
              height20,
              IconAndColorCard(),
              height16,
              Text('Repeat', style: Theme.of(context).textTheme.displayMedium),
              height8,
              LabeledActionButton(
                labelText: 'Habit Days',
                sublabelText: 'Everyday',
                onPressed: () {},
              ),
              height16,
              Text(
                'Do It At',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,
              LabeledActionButton(
                labelText: 'Habit Time',
                sublabelText: '08:00',
              ),
              height16,
              Text(
                'Daily Goal',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              height8,
              LabeledActionButton(labelText: 'Goal', sublabelText: 'off'),
              height16,
              Text(
                'Remineder',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              LabeledActionButton(
                labelText: 'Reminder for Habit',
                suffixIcon: Icons.radio_button_checked,
                iconColor: AppColors.darkOrange,
              ),
              height16,
              Text('Ends On', style: Theme.of(context).textTheme.displayMedium),
              height8,
              BuildTabBar(tabController: _tabController, tabs: _tabs),
              SizedBox(
                height: 200.h,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Center(child: Text('Off')),
                    Center(child: Text('Date')),
                    Center(child: Text('Days')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const List<Widget> _tabs = [
    Tab(text: 'Off'),
    Tab(text: 'Date'),
    Tab(text: 'Days'),
  ];
}
