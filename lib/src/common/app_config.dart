import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'global.dart';

class ThemeManager with ChangeNotifier {
  get themeMode => Hive.box(boxName).get("isDark", defaultValue: false)
      ? ThemeMode.dark
      : ThemeMode.light;

  get toggle => Hive.box(boxName).get("isDark", defaultValue: false);

  setDark(bool toggle) {
    Hive.box(boxName).put("isDark", toggle);
    notifyListeners();
  }
}

class NavigationIndex with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
