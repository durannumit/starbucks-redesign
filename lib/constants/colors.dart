import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> red = <int, Color>{
    50: Color(0xFFffedee),
    100: Color(0xFFffdbde),
    200: Color(0xFFfec8cd),
    300: Color(0xFFfeb6bd),
    400: Color(0xFFfea4ac),
    500: Color(0xFFfe929b),
    600: Color(0xFFfe808b),
    700: Color(0xFFfd6d7a),
    800: Color(0xFFfd5b6a),
    900: Color(0xFFfd4959)
  };

  static const Color background = Color(0xFFF7F8FA);
  static const Color mainTextColor = Color(0xFFEEEEEE);
  static const Color selectedTabColor = Color(0xFFFD4959);
  static const Color gradientStartColor = Color(0xFF6365C2);
  static const Color gradientEndColor = Color(0xFF292A4B);
  static const Color darkPurple = Color(0xFF1E2050);
  static const Color grey = Color(0xFF9192A7);
  static const Color detailListBackground = Color(0xFF14212E);
  static const Color dark = Color(0xFF2E2D38);
  static const Color darkGreen = Color(0xFF1D4D4F);
  static const Color mainGreen = Color(0xFF4AA366);
  static const Color darkGrey = Color(0xFF4D5661);
  static const Color buttonGrey = Color(0xFFDFE4EC);
  static const Color softGrey = Color(0xFFEFF4FD);
  static const Color proggressBarDarkGreen = Color(0xFF1D4D4F);
  static const Color gold = Color(0xFFC1A063);
}
