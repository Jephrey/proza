import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proza/controllers/preferences_controller.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  
  var _themeMode = ThemeMode.system.obs;
  ThemeMode? get themeMode => _themeMode.value;

  setThemeMode(ThemeMode themeMode) {
    Get.changeThemeMode(themeMode);
    _themeMode.value = themeMode;
    Preferences.to.theme = themeMode.toString().split('.')[1];
  }

  getThemeMode() {
    ThemeMode themeMode;
    String themeText = Preferences.to.theme;
    try {
      themeMode = ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
  }
}