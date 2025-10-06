import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static final mainColor = Color(0xFF03045E);
  static final secondColor = Color(0xFF023E8A);
  static final thirdColor = Color(0xFF0077B6);
  static final fourthColor = Color(0xFF0096C7);
  static final fifthColor = Color(0xFF00B4D8);
  static final sixthColor = Color(0xFF48CAE4);
  static final seventhColor = Color(0xFF90E0EF);
  static final eighthColor = Color(0xFFADE8F4);
  static final ninethColor = Color(0xFFCAF0F8);
  static final white = Colors.white;
  static final grey700 = Colors.grey[700];
  static final grey600 = Colors.grey[600];
  static final grey500 = Colors.grey[500];
  static final grey400 = Colors.grey[400];
  static final grey100 = Colors.grey[100];
  static final yellow = Color.fromARGB(240, 248, 153, 64);
  static final redAccent = Colors.redAccent;
  static final black = Colors.black;
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: ThemeColors.mainColor,

  //AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: ThemeColors.mainColor,
    titleTextStyle: GoogleFonts.lato(
      color: ThemeColors.white,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: ThemeColors.white),
    centerTitle: true,
    elevation: 4,
  ),

  // InputDecoration
  inputDecorationTheme: InputDecorationTheme(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      gapPadding: 4.0,
      borderSide: BorderSide(
        color: ThemeColors.eighthColor,
        width: 1.0,
      ),
    ),
    border: OutlineInputBorder(),
    filled: true,
    fillColor: ThemeColors.eighthColor,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      gapPadding: 4.0,
      borderSide: BorderSide(
        color: ThemeColors.eighthColor,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: BorderSide(
        color: ThemeColors.eighthColor,
        width: 1.0,
      ),
    ),
    labelStyle: TextStyle(
      color: ThemeColors.mainColor,
      fontSize: 16,
    ),
  ),

  //ElevatedButtom
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ThemeColors.secondColor,
      foregroundColor: ThemeColors.eighthColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),

  //Card
  cardTheme: CardThemeData(
    color: ThemeColors.fifthColor,
    elevation: 6,
  ),

  bottomAppBarTheme: BottomAppBarTheme(
    // color: mainColor.shade100,
    elevation: 4,
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 4,
    selectedItemColor: ThemeColors.sixthColor,
    unselectedItemColor: ThemeColors.fourthColor,
  ),
);
