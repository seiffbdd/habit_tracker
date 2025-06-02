part of 'icon_and_color_cubit.dart';

@immutable
sealed class IconAndColorState {}

final class IconAndColorInitial extends IconAndColorState {}

final class IconChoosed extends IconAndColorState {}

final class ColorChoosed extends IconAndColorState {}
