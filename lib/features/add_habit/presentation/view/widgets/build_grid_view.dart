import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/responsive_layout.dart';

class BuildGridView extends StatelessWidget {
  const BuildGridView({
    super.key,
    required this.length,
    required this.itemBuilder,
  });

  final int length;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveLayout.isMobile(context) ? 4 : 6,
        mainAxisSpacing: 8.w,
        crossAxisSpacing: 8.w,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
