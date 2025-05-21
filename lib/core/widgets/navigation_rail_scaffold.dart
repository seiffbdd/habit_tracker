import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/screens.dart' show screens;
import 'package:habit_tracker/core/theme/app_colors.dart';

class NavigationRailScaffold extends StatelessWidget {
  const NavigationRailScaffold({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: NavigationRail(
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.show_chart),
                  label: Text(''),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text(''),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: onDestinationSelected,
              selectedIconTheme: IconThemeData(color: AppColors.lightOrange),
              indicatorColor: AppColors.white,
            ),
          ),
          Expanded(flex: 10, child: screens[selectedIndex]),
        ],
      ),
    );
  }
}
