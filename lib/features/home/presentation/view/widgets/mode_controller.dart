import 'package:flutter/material.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/widgets/bottom_navigation_bar_scaffold.dart';
import 'package:habit_tracker/core/widgets/navigation_rail_scaffold.dart';

class ModeController extends StatefulWidget {
  const ModeController({super.key});

  @override
  State<ModeController> createState() => _HomeControllerState();
}

class _HomeControllerState extends State<ModeController> {
  int _selectedIndex = 0;

  void _onSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      portrait: BottomNavigationBarScaffold(
        selectedIndex: _selectedIndex,
        onTap: _onSelect,
      ),
      landscape: NavigationRailScaffold(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onSelect,
      ),
    );
  }
}
