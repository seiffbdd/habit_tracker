import 'package:flutter/material.dart';

abstract class Components {
  static String iconDataToString(IconData iconData) {
    return '${iconData.codePoint}|${iconData.fontFamily ?? ''}|${iconData.fontPackage ?? ''}';
  }

  static IconData stringToIconData(String data) {
    final parts = data.split('|');
    final codePoint = int.parse(parts[0]);
    final fontFamily = parts[1].isEmpty ? null : parts[1];
    final fontPackage = parts[2].isEmpty ? null : parts[2];

    return IconData(
      codePoint,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
    );
  }
}
