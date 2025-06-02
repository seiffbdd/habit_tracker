import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'icon_and_color_state.dart';

class IconAndColorCubit extends Cubit<IconAndColorState> {
  IconAndColorCubit() : super(IconAndColorInitial());

  IconData? choosedIcon;
  void chooseIcon({required IconData icon}) {
    choosedIcon = icon;
    emit(IconChoosed());
  }

  Color? choosedColor;
  void chooseColor({required Color color}) {
    choosedColor = color;
    emit(ColorChoosed());
  }
}
