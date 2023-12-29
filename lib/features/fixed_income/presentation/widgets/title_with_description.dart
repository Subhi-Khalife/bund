import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:flutter/material.dart';

class TitleWithDescription extends StatelessWidget {
  final String title;
  final String description;
  final CrossAxisAlignment crossAxisAlignment;
  const TitleWithDescription({
    super.key,
    required this.description,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: FontTextStyle.bold(
              fontSize: FontSize.copy, color: ColorsApp.mainColorsApp.natural.shade500),
        ),
        Text(
          description,
          style: FontTextStyle.bold(
              fontSize: FontSize.large + 2, color: ColorsApp.mainColorsApp.primary.shade100),
        )
      ],
    );
  }
}
