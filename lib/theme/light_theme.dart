import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: Colors.white, // White background for light theme
  primaryColor: Color.fromARGB(255, 13, 6, 87), // Deep navy blue as primary
  dividerTheme: const DividerThemeData(
    color: Color(0xFFDDDDDD), // Light gray for dividers
  ),
  focusColor: const Color(0xFFF5F5F5), // Light gray focus color
  highlightColor: const Color(0xFF212121), // Dark gray for highlights
  hoverColor: const Color(0xFFFF6B6B), // Accent light red for hover effects
  indicatorColor: const Color.fromARGB(255, 19, 2, 93), // Deep navy for indicators
  hintColor: const Color(0xFF757575), // Medium gray for hint text
  iconTheme: const IconThemeData(
    color: Color(0xFFFFB401), // Warm gold for icons to add contrast
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Color(0xFF212121)), // Dark gray for main text
    bodyText2: TextStyle(color: Color(0xFF5C5C5C)), // Secondary text
    headline6: TextStyle(color: Color.fromARGB(255, 34, 33, 39)), // Primary color for titles
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Color.fromARGB(255, 19, 2, 93)),
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 19, 2, 93),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 19, 2, 93),
    textTheme: ButtonTextTheme.primary,
  ),
);
