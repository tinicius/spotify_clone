import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConfig {
  static String get title => "Spotify";

  
  String get imageUrl => "https://miro.medium.com/max/1400/1*49OCRwcGrLHuGtFa2sF01w.jpeg";

  getTextStyle(
      {double fontSize = 12,
      Color fontColor = Colors.white,
      FontWeight fontWeight = FontWeight.normal}) {
    return GoogleFonts.poppins(
        color: fontColor, fontSize: fontSize, fontWeight: fontWeight);
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
