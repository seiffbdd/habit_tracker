import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'icon_and_color_state.dart';

class IconAndColorCubit extends Cubit<IconAndColorState> {
  IconAndColorCubit() : super(IconAndColorInitial());

  IconData? selectedIcon;
  void chooseIcon({required IconData icon}) {
    selectedIcon = icon;
    emit(IconChoosed());
  }

  Color? selectedColor;
  void chooseColor({required Color color}) {
    selectedColor = color;
    emit(ColorChoosed());
  }
}
