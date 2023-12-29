import 'package:flutter/cupertino.dart';

class FontTextStyle {
  static double _heightValue = 1.3;
  static TextStyle regular(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "Lato-Regular",
        height: _heightValue,
        decoration: textDecoration ?? TextDecoration.none);
  }

  static TextStyle thin(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "Lato-Thin",
        height: _heightValue,
        decoration: textDecoration ?? TextDecoration.none);
  }

  static TextStyle thinItalic(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: "Lato-ThinItalic",
        height: _heightValue,
        decoration: textDecoration ?? TextDecoration.none);
  }

  static TextStyle light({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-Light",
      height: _heightValue,
    );
  }

  static TextStyle lightItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-LightItalic",
      height: _heightValue,
    );
  }

  static TextStyle italic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-Italic",
      height: _heightValue,
    );
  }

  static TextStyle boldItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-BoldItalic",
      height: _heightValue,
    );
  }

  static TextStyle bold(
      {required double fontSize, required Color color, TextDecoration? textDecoration}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-Bold",
      height: _heightValue,
      decoration: textDecoration,
    );
  }

  static TextStyle black({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-Black",
      height: _heightValue,
    );
  }

  static TextStyle blackItalic({required double fontSize, required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: "Lato-BlackItalic",
      height: _heightValue,
    );
  }
}
