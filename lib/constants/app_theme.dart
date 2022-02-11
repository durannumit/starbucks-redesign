import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'font_family.dart';

final ThemeData themeData = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.red[900]!.value, AppColors.red),
  primaryColor: AppColors.mainGreen,
  primaryColorBrightness: Brightness.light,
  textTheme: TextTheme(
    headline1: const TextStyle(
      color: AppColors.dark,
      fontWeight: FontWeight.w900,
      fontSize: 30,
      height: 1.2,
    ),
    headline2: const TextStyle(
      color: AppColors.darkGreen,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline3: const TextStyle(
      color: AppColors.dark,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    headline4: const TextStyle(
      color: AppColors.dark,
      fontWeight: FontWeight.w900,
      fontSize: 14,
    ),
    bodyText1: const TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColors.darkGrey,
    ),
    subtitle1: TextStyle(
      fontSize: 14,
      color: AppColors.dark.withOpacity(.5),
      height: 1.6,
    ),
    button: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.dark,
  primaryColor: AppColors.selectedTabColor,
  primaryColorBrightness: Brightness.dark,
);
