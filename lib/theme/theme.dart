import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.amber,
  fontFamily: 'Poppins',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 48),
      backgroundColor: const Color.fromARGB(255, 242, 74, 74),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide.none,
      ),
      elevation: 0,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color(0xFFFBFBFB),
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 255, 1, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

