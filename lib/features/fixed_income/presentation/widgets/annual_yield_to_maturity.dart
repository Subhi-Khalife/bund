import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/core/widgets/sized_boxes/sw.dart';
import 'package:flutter/material.dart';

class AnnualYieldToMaturity extends StatelessWidget {
  const AnnualYieldToMaturity({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Annual Yield To Maturity (YTM) ",
                style: FontTextStyle.regular(
                  fontSize: FontSize.medium,
                  color: ColorsApp.mainColorsApp.natural.shade500,
                ),
              ),
              const SW4(),
            ],
          ),
          const Sh8(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "6.81%",
                style: FontTextStyle.regular(
                  fontSize: FontSize.heading_04,
                  color: ColorsApp.mainColorsApp.primary.shade100,
                ),
              ),
              const SW4(),
            ],
          ),
        ],
      ),
    );
  }
}
