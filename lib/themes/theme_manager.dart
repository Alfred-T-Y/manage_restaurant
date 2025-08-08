import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeManager {

  bool _loadMode() => Get.isDarkMode;

  void _saveMode(bool isDarkMode) => Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);

  ThemeMode get theme => _loadMode() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _saveMode(!Get.isDarkMode);
  }

}