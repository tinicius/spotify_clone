import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static String get title => "Spotify";

  getTextStyle({double fontSize = 12}) {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontSize: fontSize,
    );
  }

  static Color get black => Colors.black;
  static Color get green => Colors.green;
  static Color get grey => Colors.grey.shade900;

  static Color get selectedItemColor => Colors.white;
  static Color get unselectedItemColor => Colors.grey;

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.green,
        appBarTheme: const AppBarTheme(color: Colors.black),
      );
}
