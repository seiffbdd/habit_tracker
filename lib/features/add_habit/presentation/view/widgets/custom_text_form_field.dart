import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        labelText: 'Habit Name',
        labelStyle: Theme.of(context).textTheme.displayLarge,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),

      style: Theme.of(context).textTheme.displayLarge,
      cursorColor: Colors.black,
    );
  }
}
