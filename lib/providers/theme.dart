import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider({bool isDarkMode}) {
    _selectedTheme = isDarkMode ? dark : light;
  }

  ThemeData _selectedTheme;
  SharedPreferences prefs;

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
  );

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,
  );

  ThemeData getTheme() => _selectedTheme;

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool('darkTheme', false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool('darkTheme', true);
    }

    notifyListeners();
  }
}
