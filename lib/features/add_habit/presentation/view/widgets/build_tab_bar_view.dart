import 'package:flutter/material.dart';

class BuildTabBarView extends StatelessWidget {
  const BuildTabBarView({super.key, this.canScroll = true, this.tabController});
  final bool canScroll;
  final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      physics: canScroll ? null : NeverScrollableScrollPhysics(),
      children: [
        Center(child: Text('Off')),
        Center(child: Text('Date')),
        Center(child: Text('Days')),
      ],
    );
  }
}
