import 'package:flutter/material.dart';

class ColorsManager {
  static const Map<int, Color> colorsMap = {
    50: ColorsManager.primary,
    100: ColorsManager.primary,
    200: ColorsManager.primary,
    300: ColorsManager.primary,
    400: ColorsManager.primary,
    500: ColorsManager.primary,
    600: ColorsManager.primary,
    700: ColorsManager.primary,
    800: ColorsManager.primary,
    900: ColorsManager.primary,
  };
  static const Color primary = Color(0xFFf06833);
  static MaterialColor primarySwatch = MaterialColor(primary.value, colorsMap);
  static Color primaryOpacity70 = const Color(0xB3f06833).withOpacity(0.7);
  static const Color extraLightGrey = Color(0xFFE1E1E1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkPrimary = Color(0xFFE65116);
  static const Color grey = Color(0xFF737477);
  static const Color darkGrey = Color(0xFF525252);
  static const Color lightGrey = Color(0xFF9E9E9E);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey1 = Color(0xFF707070);
  static const Color transparent = Color(0xAAFFFFFF);
  static const Color blue = Color(0xFF0000FF);
  static const Color blue200 = Color(0xFF90CAF9);
  static const Color indigoAccent = Color(0xFF3D5AFE);
  static const Color black = Color(0xFF000000);
  static const Color black12 = Color(0x1F000000);
  static const Color black54 = Color(0x8A000000);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color yellow600 = Color(0xFFFDD835);
  static const Color green = Color(0xFF4CAF50);
  static const Color green300 = Color(0xFF81C784);
  static const Color red = Color(0xFFFF0000);
  static const Color redAccent = Color(0xFFFF5252);
  static const Color deepOrangeAccent = Color(0xFFFF6E40);
  static const Color deepOrangeAccent100 = Color(0xFFFF5252);

  static const Color error = Color(0xFFe61f34); // red color
}
