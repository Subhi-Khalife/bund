import 'package:flutter/material.dart';

import 'main_colors.dart';

class LightModeTheme implements MainColors {
  static const int _primaryPrimaryValue = 0xff1C2C56;
  static const int _naturalPrimaryValue = 0xff9e9e9e;
  static const int _secondaryPrimaryValue = 0xff46AF35;
  static const int _wrongPrimaryValue = 0xfff2ca79;
  static const int _semanticSecondaryPrimaryValue = 0xff35b23e;
  static const int _primaryContainerColor = 0xffffffff;
  @override
  MaterialColor danger = const MaterialColor(
    0xffd12a2a,
    <int, Color>{
      50: Color(0xfffbe9e9),
      100: Color(0xffd12a2a),
      200: Color(0xff7d1919),
    },
  );

  @override
  MaterialColor containerColors = const MaterialColor(
    _primaryContainerColor,
    <int, Color>{
      50: Color(0xfff0f1f5),
      100: Color(0xffD9D9D9),
      200: Color(0xffE6E9F1),
    },
  );

  @override
  MaterialColor natural = const MaterialColor(
    _naturalPrimaryValue,
    <int, Color>{
      50: Color(0xffffffff),
      100: Color(0xfff5f5f5),
      300: Color(0xffA4ABBB),
      500: Color(0xff77809A),
      600: Color(0xff737373),
      700: Color(0xff495678),
      800: Color(0xff0B1222),
      900: Color(0xff46AF35),
    },
  );

  @override
  MaterialColor primary = const MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      100: Color(0xff1C2C56),
      200: Color(0xff050B29),
      300: Color(0xff132F56),
      400: Color(0xffC7C7C7),
      700: Color(_primaryPrimaryValue),
      800: Color(0xff48C8F0),
      900: Color(0xff0a1933),
    },
  );

  @override
  MaterialColor secondary = const MaterialColor(
    _secondaryPrimaryValue,
    <int, Color>{
      50: Color(0xff46AF35),
    },
  );

  @override
  MaterialColor semanticSecondary = const MaterialColor(
    _semanticSecondaryPrimaryValue,
    <int, Color>{
      50: Color(0xffeaf7eb),
      100: Color(_semanticSecondaryPrimaryValue),
      200: Color(0xff1f6b25),
    },
  );

  @override
  MaterialColor wrong = const MaterialColor(
    _wrongPrimaryValue,
    <int, Color>{
      50: Color(0xfffff7e6),
      100: Color(_wrongPrimaryValue),
      200: Color(0xff917948),
    },
  );

  @override
  Color scaffoldColor = Colors.grey.shade100;
}
