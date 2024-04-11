import 'package:flutter/material.dart';

abstract interface class IAppColors {
  Color get appBarColor;
  Color get appBarTextColor;
  Color get buttonColor;
  Color get scaffoldColor;
  Color get textColor;
}

class AppColorsDark implements IAppColors {
  @override
  Color get appBarColor => const Color(0xFF111111);
  @override
  Color get appBarTextColor => const Color(0xFFFFFFFF);
  @override
  Color get buttonColor => const Color(0xFF777777);
  @override
  Color get scaffoldColor => const Color(0xFF333333);
  @override
  Color get textColor => const Color(0xFFFFFFFF);
}

class AppColorsLight implements IAppColors {
  @override
  Color get appBarColor => Colors.green[300]!;
  @override
  Color get appBarTextColor => const Color(0xFF333333);
  @override
  Color get buttonColor => Colors.greenAccent;
  @override
  Color get scaffoldColor => Colors.white;
  @override
  Color get textColor => const Color(0xFF333333);
}
