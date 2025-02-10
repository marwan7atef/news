import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  static const Color black=Color(0xff171717);
  static const Color white=Color(0xffFFFFFF);
  static const Color gray=Color(0xffA0A0A0);
  static ThemeData darkMode =ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: black,
      foregroundColor: white,
      titleTextStyle:TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,


      )

    ),
    scaffoldBackgroundColor: black,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: white,


      ),
      labelLarge: TextStyle(
fontWeight: FontWeight.bold,
        fontSize: 16,
        color: white

      ),
      labelMedium: TextStyle(
fontWeight: FontWeight.w500,
        fontSize: 14,
        color: white,


      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: gray,


      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: white,


      ),



    )




  );
  static ThemeData lightMode =ThemeData(




  );



}