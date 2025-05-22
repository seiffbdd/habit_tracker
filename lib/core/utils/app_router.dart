import 'package:go_router/go_router.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/add_habit_view.dart';
import 'package:habit_tracker/features/home/presentation/view/widgets/main_view.dart';

abstract class AppRouter {
  static const mainView = '/mainView';
  static const addHabitView = '/addHabitView';

  static final router = GoRouter(
    initialLocation: mainView,

    routes: [
      GoRoute(path: mainView, builder: (context, state) => MainView()),
      GoRoute(path: addHabitView, builder: (context, state) => AddHabitView()),
    ],
  );
}
