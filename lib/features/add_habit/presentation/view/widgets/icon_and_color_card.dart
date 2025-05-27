import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/constants/icon_colors.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_grid_view.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_icon_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';

class IconAndColorCard extends StatelessWidget {
  const IconAndColorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.lightGrey,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.h),
            child: Icon(Icons.face),
          ),
          Expanded(
            child: Column(
              children: [
                LabeledActionButton(
                  labelText: 'Icon',
                  disabledBorder: true,
                  onPressed: () async {
                    await Components.showDefaultBottomSheet(
                      context,
                      child: BuildIconBottomSheet(),
                    );
                  },
                ),
                Divider(height: 0),
                LabeledActionButton(
                  labelText: 'Color',
                  disabledBorder: true,
                  sublabel: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightOrange,
                    ),
                    height: 22.h,
                    width: 22.h,
                  ),
                  onPressed: () {
                    Components.showDefaultBottomSheet(
                      context,
                      child: BuildBottomSheet(
                        titleText: 'Icon Color',
                        body: BuildGridView(
                          length: iconColors.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                // Set the selected color in the viewmodel
                                context.pop();
                              },
                              child: Center(
                                child: Container(
                                  width: 50.w,
                                  height: 50.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: iconColors[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
