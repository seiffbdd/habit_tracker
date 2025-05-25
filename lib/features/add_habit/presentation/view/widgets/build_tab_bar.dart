import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
    required TabController tabController,
    required List<Widget> tabs,
  }) : _tabController = tabController,
       _tabs = tabs;

  final TabController _tabController;
  final List<Widget> _tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (value) {},
      controller: _tabController,
      tabs: _tabs,
      indicator: BoxDecoration(color: AppColors.darkOrange),
      dividerHeight: 0.0,
      labelColor: AppColors.white,
      unselectedLabelColor: AppColors.blackGrey,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }
}
