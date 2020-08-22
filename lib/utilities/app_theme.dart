import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme() {
  return new ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: AppColors.mainColor,
    accentColor: AppColors.mainColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(

    ),

    // Define the default font family.
    fontFamily: 'Roboto',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle( fontFamily: 'Roboto'),
    ),
  );
}
