import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_theme.dart';
import 'package:habit_tracker/core/utils/app_router.dart';

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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
