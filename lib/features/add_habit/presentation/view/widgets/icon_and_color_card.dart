import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker/core/constants/icon_colors.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';
import 'package:habit_tracker/core/utils/components.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_grid_view.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/build_icon_bottom_sheet.dart';
import 'package:habit_tracker/features/add_habit/presentation/view/widgets/labeled_action_button.dart';
import 'package:habit_tracker/features/add_habit/presentation/view_model/icon_and_color_cubit/icon_and_color_cubit.dart';

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
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: BlocBuilder<IconAndColorCubit, IconAndColorState>(
              // buildWhen: (previous, current) => current is IconChoosed,
              builder: (context, state) {
                return Icon(
                  context.read<IconAndColorCubit>().choosedIcon ??
                      Icons.punch_clock,
                  color:
                      context.read<IconAndColorCubit>().choosedColor ??
                      AppColors.darkOrange,
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              children: [
                LabeledActionButton(
                  labelText: 'Icon',
                  disabledBorder: true,
                  onPressed: () async {
                    await _buildIconsBottomSheet(context);
                  },
                ),
                Divider(height: 0),
                LabeledActionButton(
                  labelText: 'Color',
                  disabledBorder: true,
                  sublabel: BlocBuilder<IconAndColorCubit, IconAndColorState>(
                    buildWhen: (previous, current) => current is ColorChoosed,
                    builder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.read<IconAndColorCubit>().choosedColor,
                        ),
                        height: 22.h,
                        width: 22.h,
                      );
                    },
                  ),
                  onPressed: () async {
                    await _buildColorsBottomSheet(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _buildIconsBottomSheet(BuildContext context) {
    return Components.showDefaultBottomSheet(
      context,
      child: BlocProvider.value(
        value: context.read<IconAndColorCubit>(),
        child: const BuildIconBottomSheet(),
      ),
    );
  }

  Future<dynamic> _buildColorsBottomSheet(BuildContext context) {
    return Components.showDefaultBottomSheet(
      context,
      child: BuildBottomSheet(
        titleText: 'Choose Color',
        body: BuildGridView(
          length: iconColors.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                context.read<IconAndColorCubit>().chooseColor(
                  color: iconColors[index],
                );
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
  }
}
