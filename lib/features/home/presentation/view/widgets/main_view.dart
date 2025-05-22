import 'package:flutter/material.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/widgets/bottom_navigation_bar_scaffold.dart';
import 'package:habit_tracker/core/widgets/navigation_rail_scaffold.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<MainView> {
  int _selectedIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: BottomNavigationBarScaffold(
        selectedIndex: _selectedIndex,
        onTap: _onSelect,
      ),
      tablet: NavigationRailScaffold(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onSelect,
      ),
    );
  }
}
