import 'package:flutter/material.dart';
import 'package:isarcrud/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

// getter method to check if in darkMode
  bool get isDarkMode => _themeData == darkmode;


// set the new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkmode;
    } else {
      themeData = lightMode;
    }
  }
}
