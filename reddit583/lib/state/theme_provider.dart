import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.dark;

  ThemeMode get mode => _mode;

  bool get isDark => _mode == ThemeMode.dark;

  void setDark(bool value) {
    final next = value ? ThemeMode.dark : ThemeMode.light;
    if (next == _mode) return;
    _mode = next;
    notifyListeners();
  }
}
