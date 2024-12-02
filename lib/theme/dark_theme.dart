import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF0D0F20), // Dark blue-gray background
  primaryColor: const Color.fromARGB(255, 19, 2, 93), // Deep navy blue
  dividerTheme: const DividerThemeData(
    color: Color(0xFF26364E), // Subtle gray divider
  ),
  focusColor: const Color(0xFF2B3A67), // Soft blue-gray for focus
  highlightColor: const Color(0xFF5C6BC0), // Muted light blue for highlights
  hoverColor: const Color(0xFFD32F2F), // Accent red for hover effects
  indicatorColor: const Color(0xFF64B5F6), // Bright blue for active indicators
  hintColor: const Color(0xFFB0BEC5), // Cool gray for hint text
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 19, 2, 93), // Icon color matches primary color
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Color(0xFFCAD2E2)), // Soft, readable text
    bodyText2: TextStyle(color: Color(0xFFB0BEC5)), // Secondary text color
    headline6: TextStyle(color: Color(0xFF64B5F6)), // Light blue for headlines
  ),
);
