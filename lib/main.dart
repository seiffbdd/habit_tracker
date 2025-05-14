import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_theme.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/widgets/custom_buttom_navigation_bar.dart';
import 'package:habit_tracker/core/widgets/custom_navigation_rail.dart';

void main() {
  runApp(const HabitTracker());
}

class HabitTracker extends StatelessWidget {
  const HabitTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: ResponsiveLayout(
            portrait: CustomButtomNavigationBar(),
            landscape: CustomNavigationRail(),
          ),
        );
      },
    );
  }
}
