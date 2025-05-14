import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/global/theme/app_colors.dart';
import 'package:habit_tracker/features/home/presentation/view/portrait_home_view.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({super.key});

  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int currentIndex = 0;
  final List<Widget> screens = [
    PortraitHomeView(),
    Center(child: Text('Histore')),
    Center(child: Text('Progress')),
    Center(child: Text('Settings')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
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
      body: screens[currentIndex],
    );
  }
}
