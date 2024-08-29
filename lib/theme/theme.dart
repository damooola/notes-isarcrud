import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      primary: Colors.grey.shade500,
      surface: Colors.grey.shade300,
      inversePrimary: Colors.grey.shade800,
      secondary: Colors.grey.shade400),
);
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade800,
      surface: Colors.grey.shade900,
      inversePrimary: Colors.grey.shade300,
      secondary: Colors.grey.shade700),
);

ThemeData _themeData = lightMode;
ThemeData get themeData => _themeData;
set(ThemeData themeData) {
  _themeData = themeData;
}
