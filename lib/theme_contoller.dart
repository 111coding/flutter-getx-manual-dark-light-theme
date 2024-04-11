import 'package:flutter/material.dart';
import 'package:flutter_example_dark_light/app_colors.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late IAppColors _activeColors;
  IAppColors get activeColor => _activeColors;
  final _dark = AppColorsDark();
  final _light = AppColorsLight();

  bool get isDark => _activeColors == _dark;

  ThemeController() {
    // Device 의 테마를 가져와 적용
    _activeColors = Get.context == null ||
            MediaQuery.of(Get.context!).platformBrightness == Brightness.light
        ? _light
        : _dark;
  }

  void toggleTheme() {
    _activeColors = _activeColors is AppColorsDark ? _light : _dark;
    update();
  }
}
