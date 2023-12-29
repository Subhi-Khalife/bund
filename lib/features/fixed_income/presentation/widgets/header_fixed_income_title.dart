import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:flutter/material.dart';

class HeaderFixedIncomeTitle extends StatelessWidget {
  const HeaderFixedIncomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fixed Income Portfolio",
            style: FontTextStyle.bold(
                fontSize: FontSize.large + 2, color: ColorsApp.mainColorsApp.natural.shade800),
          ),
          const Sh8(),
          Text(
            "A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.",
            style: FontTextStyle.bold(
                fontSize: FontSize.small, color: ColorsApp.mainColorsApp.natural.shade700),
          )
        ],
      ),
    );
  }
}
