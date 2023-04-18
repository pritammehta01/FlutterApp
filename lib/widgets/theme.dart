import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      canvasColor: Colors.black,
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)));

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: Colors.white,
      // primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: context.canvasColor, fontSize: 20)));
  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBlue = Color(0xff403b58);
}
