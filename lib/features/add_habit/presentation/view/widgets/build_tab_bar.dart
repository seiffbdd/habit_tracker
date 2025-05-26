import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class BuildTabBar extends StatelessWidget {
  const BuildTabBar({
    super.key,
    this.tabController,
    required this.tabs,
    this.indicatorDecoration,
    this.isScrollable = false,
    this.dividerHeight = 0.0,
    this.wantPrimaryDecoration = true,
    this.labelColor,
    this.unSelectedLabelColor,
  });

  final TabController? tabController;
  final List<Widget> tabs;
  final Decoration? indicatorDecoration;
  final bool isScrollable;
  final double dividerHeight;
  final bool wantPrimaryDecoration;
  final Color? labelColor;
  final Color? unSelectedLabelColor;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: isScrollable,
      onTap: (value) {},
      controller: tabController,
      tabs: tabs,
      indicator:
          indicatorDecoration == null
              ? wantPrimaryDecoration
                  ? BoxDecoration(color: AppColors.darkOrange)
                  : null
              : null,
      dividerHeight: dividerHeight,
      labelColor: labelColor ?? AppColors.white,
      unselectedLabelColor: unSelectedLabelColor ?? AppColors.blackGrey,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: Theme.of(context).textTheme.displayLarge,
    );
  }
}
