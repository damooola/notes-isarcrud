import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      primary: Colors.grey.shade400,
      surface: const Color.fromARGB(255, 218, 216, 216),
      inversePrimary: const Color.fromARGB(255, 61, 60, 60),
      secondary: Colors.grey.shade400),
);
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 34, 33, 33),
      surface: Color.fromARGB(255, 15, 14, 14),
      inversePrimary: Color.fromARGB(245, 241, 238, 238),
      secondary: Color.fromARGB(255, 119, 114, 114)),
);

ThemeData _themeData = lightMode;
ThemeData get themeData => _themeData;
set(ThemeData themeData) {
  _themeData = themeData;
}
