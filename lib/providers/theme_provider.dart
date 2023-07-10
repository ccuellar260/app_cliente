import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  ThemeData theme = ThemeData(useMaterial3: true);

  bool get isDark => _isDark;

  set isDark(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }
}
