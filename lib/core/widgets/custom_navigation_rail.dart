import 'package:flutter/material.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/features/home/presentation/view/landscape_home_view.dart';

class CustomNavigationRail extends StatefulWidget {
  const CustomNavigationRail({super.key});

  @override
  State<CustomNavigationRail> createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    LandscapeHomeView(),
    Center(child: Text('Histore')),
    Center(child: Text('Progress')),
    Center(child: Text('Settings')),
  ];
  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onDestinationSelected,
              selectedIconTheme: IconThemeData(color: AppColors.lightOrange),
              indicatorColor: AppColors.white,
            ),
          ),
          Expanded(flex: 9, child: screens[_selectedIndex]),
        ],
      ),
    );
  }
}
