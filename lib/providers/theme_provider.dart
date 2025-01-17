import 'package:flutter/material.dart';
import 'package:weather_app/themes/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData themeData = lightMode;
  bool isSelected = false;

  ThemeData get getThemeData => themeData;
  bool get getIsSelected => isSelected;

  void toggleThemeData() {
    if (themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
    isSelected = !isSelected;

    notifyListeners();
  }
}
