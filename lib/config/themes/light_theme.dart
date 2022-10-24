import 'package:flutter/material.dart';

/// Color Palette for light theme
class ColorLight {
  ColorLight._();

  static MaterialColor tiger = MaterialColor(
    const Color(0xFFEF5431).value,
    const <int, Color>{
      100: Color(0xFFFCDDD6),
      200: Color(0xFFFCDDD6),
      300: Color(0xFFF59883),
      400: Color(0xFFF59883),
      500: Color(0xFFEF5431),
      600: Color(0xFFEF5431),
      700: Color(0xFFBF4327),
      900: Color(0xFF8F321D)
    },
  );
  static const Color doffBlack = Color(0xFF231F20);
  static const Color neutralWhite = Color(0xFFF8F7F7);
  static const Color textGrey = Color(0xFF747172);
  static const Color ashGrey = Color(0xFF8E8B8C);
  static const Color borderShade = Color(0xFFDEDEDE);
  static const Color raspberry = Color(0xFFE20055);
  static const Color sunglow = Color(0xFFFFD23F);
  static const Color tango = Color(0xFF6FCACF);
  static const Color torque = Color(0xFF25A8A0);
  static const List<Color> tigerBerry = [Color(0xFFF57D20), Color(0xFFE20055)];
}
