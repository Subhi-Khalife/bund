import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/features/fixed_income/data/model/term/term.dart';
import 'package:flutter/material.dart';

class TermTypesListItem extends StatelessWidget {
  final TermModel termModel;
  final Color? backGroundColor;
  final bool isActive;
  const TermTypesListItem({
    super.key,
    this.backGroundColor,
    required this.termModel,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive
              ? ColorsApp.mainColorsApp.containerColors.shade200
              : backGroundColor ?? ColorsApp.mainColorsApp.containerColors,
          border: Border.all(
            color: isActive ? ColorsApp.mainColorsApp.primary.shade100 : Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${termModel.duration} Year Term",
                style: FontTextStyle.regular(
                  fontSize: FontSize.small,
                  color: ColorsApp.mainColorsApp.natural.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
