import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/custom_button.dart';

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
                CustomButton(labelText: 'Icon', disabledBorder: true),
                Divider(height: 0),
                CustomButton(labelText: 'Color', disabledBorder: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
