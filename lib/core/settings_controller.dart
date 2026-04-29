import 'package:flutter/material.dart';

enum AppLanguage { es, en, fr }

class SettingsController extends ChangeNotifier {
  static final SettingsController _instance = SettingsController._internal();
  factory SettingsController() => _instance;
  SettingsController._internal();

  ThemeMode themeMode = ThemeMode.dark;
  AppLanguage language = AppLanguage.es;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void changeLanguage(AppLanguage newLang) {
    language = newLang;
    notifyListeners();
  }
}
