import 'package:flutter/material.dart';
import 'package:habit_tracker/core/responsive_layout.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class IconsGridView extends StatelessWidget {
  const IconsGridView({super.key, required this.icons});

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isMobile(context) ? buildMobile() : buildTablet();
  }

  GridView buildMobile() {
    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, gridIndex) {
        return buildDefaultIconButton(icon: icons[gridIndex]);
      },
    );
  }

  GridView buildTablet() {
    return GridView.builder(
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemBuilder: (context, gridIndex) {
        return buildDefaultIconButton(icon: icons[gridIndex]);
      },
    );
  }

  IconButton buildDefaultIconButton({required IconData icon}) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: AppColors.white),
    );
  }
}
