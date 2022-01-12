import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.rubik,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.red[900]!.value, AppColors.red),
  primaryColor: AppColors.red[900],
  primaryColorBrightness: Brightness.light,
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.rubik,
  brightness: Brightness.dark,
  primaryColor: AppColors.selectedTabColor,
  primaryColorBrightness: Brightness.dark,
);
