import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:flutter/material.dart';
enum ButtonType { normal, outLined }

class _ButtonAppColors {
  const _ButtonAppColors({
    required this.backGroundColor,
    required this.borderColor,
    required this.fontTextColor,
  });
  final Color borderColor;
  final Color backGroundColor;
  final Color fontTextColor;
}

// ignore: camel_case_extensions
extension getTitleColor on ButtonType {
  // ignore: library_private_types_in_public_api
  _ButtonAppColors get typeColor {
    switch (this) {
      case ButtonType.normal:
        return _ButtonAppColors(
          backGroundColor: ColorsApp.mainColorsApp.primary.shade100,
          borderColor: Colors.transparent,
          fontTextColor: ColorsApp.mainColorsApp.natural.shade50,
        );
      case ButtonType.outLined:
        return _ButtonAppColors(
          fontTextColor: ColorsApp.mainColorsApp.primary,
          backGroundColor: ColorsApp.mainColorsApp.natural.shade50,
          borderColor: ColorsApp.mainColorsApp.primary,
        );
    }
  }
}

class AppButton extends StatelessWidget {
  final String buttonText;
  final ButtonType buttonType;
  final Function? onPress;
  final double buttonBorderRadius;
  final Color? buttonBgColor;
  final Color? buttonBorderColor;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final double? fontSize;
  final double? height;
  final double? width;
  final double contentPadding;
  final TextStyle? fontTextStyle;
  final Widget? contentWidget;
  const AppButton({
    Key? key,
    this.contentWidget,
    this.fontTextStyle,
    this.onPress,
    this.buttonType = ButtonType.normal,
    this.contentPadding = 16,
    required this.buttonText,
    this.buttonBorderRadius = 12,
    this.buttonBgColor,
    this.buttonBorderColor,
    this.fontSize,
    this.textFontWeight,
    this.textColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          //The purpose of MaterialStateProperty is to make it possible to specify different styles for different states
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return buttonBgColor ?? buttonType.typeColor.backGroundColor;
          }),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            return buttonBgColor ?? buttonType.typeColor.backGroundColor;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(buttonBorderRadius),
              side: BorderSide(
                color: buttonBorderColor ?? buttonType.typeColor.borderColor,
              ),
            ),
          ),
        ),
        onPressed: () {
          if (onPress != null) {
            onPress!();
          }
        },
        child: contentWidget ??
            Padding(
              padding: EdgeInsets.all(contentPadding),
              child: Text(
                buttonText,
                style: fontTextStyle ??
                    FontTextStyle.regular(
                      fontSize: FontSize.medium,
                      color: buttonType.typeColor.fontTextColor,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      ),
    );
  }
}
