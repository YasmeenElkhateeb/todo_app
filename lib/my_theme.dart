import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xFF5D9CEC);
  static Color blueColor = Color(0xFF5D9CEC);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color greenColor = Color(0xFF61E757);
  static Color redColor = Color(0xFFEC4B4B);
  static Color grayColor = Color(0xFFA9A9A9);
  static Color mainColorLight = Color(0xFFDFECDB);
  static Color blackLight = Color(0xFF363636);
  static Color mainColorDark = Color(0xFF060E1E);
  static Color blackDark = Color(0xFF141922);

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: mainColorLight,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryLight,
        elevation: 0,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: whiteColor, fontWeight: FontWeight.bold, fontSize: 22),

          headline3: TextStyle(
              color: blackLight, fontSize: 14),
          subtitle1: TextStyle(
              color: primaryLight, fontSize: 14),
        subtitle2: TextStyle(
            color: greenColor, fontSize: 14),

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: primaryLight,
        unselectedItemColor: grayColor,
      ),
    selectedRowColor: primaryLight,

  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: mainColorDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryLight,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: blackDark, fontWeight: FontWeight.bold, fontSize: 22),

      headline3: TextStyle(
          color: whiteColor, fontSize: 14),
      subtitle2: TextStyle(
          color: greenColor, fontSize: 14),
      subtitle1: TextStyle(
          color: primaryLight, fontSize: 20),
      bodyText1: TextStyle(
        color: blackDark, fontSize: 15),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: primaryLight,
      unselectedItemColor: grayColor,
    ),
    selectedRowColor: primaryLight,
  );
}
