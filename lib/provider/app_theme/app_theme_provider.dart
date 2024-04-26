import 'package:beonchat_admin/service/cache_storage/shared_pref.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  CachedStorage darkThemePreference = CachedStorage();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setBool(key: "theme", value: value);
    notifyListeners();
  }
}


