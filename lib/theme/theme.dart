import 'package:flutter/material.dart';
import 'package:ha9i/const/constants.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.amber,
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
    border: defaultOutlineInputBorder,
    enabledBorder: defaultOutlineInputBorder,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 255, 1, 1)),
    ),
  ),
);
