import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class ThemeHelper {

  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    brightness: Brightness.light,
    textTheme: TextThemes.textTheme(color: primaryTextGrey),
    appBarTheme: const AppBarTheme(
        color: Colors.white
    ),
    primaryColor: primaryGreen,
    indicatorColor: primaryGreen,
    unselectedWidgetColor: primaryTextGrey,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
        circularTrackColor: primaryLightGreen
    ),
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  );

  // static ThemeData darkTheme = ThemeData.dark(
  //   useMaterial3: true,
  // ).copyWith(
  //   primaryColor: primaryPurple,
  //   brightness: Brightness.dark,
  //   indicatorColor: primaryPurple,
  //   appBarTheme: const AppBarTheme(
  //       color: primaryBlack
  //   ),
  //   unselectedWidgetColor: primaryGrey,
  //   splashColor: Colors.transparent,
  //   progressIndicatorTheme: const ProgressIndicatorThemeData(
  //     circularTrackColor: Colors.white,
  //   ),
  //   textTheme: TextThemes.textTheme(color: Colors.white),
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: primaryBlack,
  //     brightness: Brightness.dark,
  //   ),
  // );
}

class TextThemes {

  static TextTheme textTheme({required Color color}) => TextTheme(
    headlineMedium: TextStyle(
      color: color,
      fontSize: 32,
      letterSpacing: -1,
      fontWeight: FontWeight.w500
    ),
    headlineSmall: TextStyle(
      color: color,
      fontSize: 25,
      letterSpacing: -1,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      color: color,
      fontSize: 21,
      letterSpacing: -1,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: color,
      fontSize: 18,
      letterSpacing: -1,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: color,
      fontSize: 15,
      letterSpacing: -1,
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
        color: color,
        fontSize: 13,
        letterSpacing: -1,
        fontWeight: FontWeight.w400,
        // height: 2.8
    ),
    labelSmall: TextStyle(
        color: color,
        fontSize: 10,
      letterSpacing: -1,
        fontWeight: FontWeight.w400,
        // height: 2.8
    ),
  ).apply(
    fontFamily: GoogleFonts.inter().fontFamily
  );
}