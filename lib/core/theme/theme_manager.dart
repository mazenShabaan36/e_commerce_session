import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  static void toggleTheme() {
    themeNotifier.value =
        themeNotifier.value == ThemeMode.light
            ?
            //
            ThemeMode.dark
            : ThemeMode.light;
  }
}
