import 'package:flutter/material.dart';

class ThemeConfig {
  static String get title => "Spptify";

  static Color get black => Colors.black;
  static Color get selectedItemColor => Colors.white;
  static Color get unselectedItemColor => Colors.grey;

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.black),
      );
}
