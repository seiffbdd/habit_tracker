import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/constants/icons_by_category.dart';
import 'package:habit_tracker/core/constants/icons_categories.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/default_icon_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_tab_bar.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_grid_view.dart';

class BuildIconBottomSheet extends StatefulWidget {
  const BuildIconBottomSheet({super.key});

  @override
  State<BuildIconBottomSheet> createState() => _BuildIconBottomSheetState();
}

class _BuildIconBottomSheetState extends State<BuildIconBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _iconsCategoriesTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
              child: BuildTabBar(
                tabController: _tabController,
                tabs: _iconsCategoriesTabs,
                isScrollable: true,
                wantPrimaryDecoration: false,
                labelColor: AppColors.white,
                unSelectedLabelColor: AppColors.grey,
              ),
            ),
            Expanded(child: _getIconsTabBarView()),
          ],
        ),
      ),
    );
  }

  TabBarView _getIconsTabBarView() {
    return TabBarView(
      controller: _tabController,

      children: List.generate(iconsCategories.length, (index) {
        /// Get the current category from the list of categories
        final category = iconsCategories[index];

        /// Retrieve the icons for the current category
        final icons = iconsByCategory[category.toLowerCase()] ?? [];

        return BuildGridView(
          length: icons.length,
          itemBuilder: (_, gridIndex) {
            return DefaultIconButton(icon: icons[gridIndex]);
          },
        );
      }),
    );
  }

  List<Widget> get _iconsCategoriesTabs {
    return iconsCategories.map((category) => Tab(text: category)).toList();
  }
}
