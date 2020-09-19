import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fetch_more_data_internet/providers/theme.dart';
import 'screens/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  return runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(
        isDarkMode: _prefs.getBool('darkTheme') ?? false, // null-aware operator
      ),
      child: MyApp(),
    ),
  );
}
