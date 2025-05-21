import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/constants/screens.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class BottomNavigationBarScaffold extends StatelessWidget {
  const BottomNavigationBarScaffold({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: selectedIndex,
        iconSize: 24.h,
        selectedItemColor: AppColors.lightOrange,
        unselectedItemColor: AppColors.grey,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
