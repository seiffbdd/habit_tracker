import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/add_habit_view.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/ends_on_cubit/ends_on_cubit.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/icon_and_color_cubit/icon_and_color_cubit.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/reminder_cubit/reminder_cubit.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/goal_type_cubit/goal_type_cubit.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/main_view.dart';

abstract class AppRouter {
  static const mainViewName = 'mainView';
  static const mainViewPath = '/';

  static const addHabitViewName = 'addHabitView';
  static const addHabitViewPath = '/addHabitView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        name: mainViewName,
        path: mainViewPath,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        name: addHabitViewName,
        path: addHabitViewPath,
        builder:
            (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider<GoalTypeCubit>(
                  create: (context) => GoalTypeCubit(),
                ),
                BlocProvider<ReminderCubit>(
                  create: (context) => ReminderCubit(),
                ),
                BlocProvider<IconAndColorCubit>(
                  create: (context) => IconAndColorCubit(),
                ),
                BlocProvider<EndsOnCubit>(create: (context) => EndsOnCubit()),
              ],
              child: const AddHabitView(),
            ),
      ),
    ],
  );
}
