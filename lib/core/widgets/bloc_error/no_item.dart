import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:flutter/material.dart';

import '../show_svg.dart';
import '../sized_boxes/sh.dart';

class NoItem extends StatelessWidget {
  final Function clickActionFunction;
  final String? svgImage;
  final String? errorTitle;
  const NoItem(
      {Key? key, required this.clickActionFunction, required this.svgImage, this.errorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickActionFunction(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (svgImage != null) ShowSvg(svgImage!),
            const Sh8(),
            Text(
              "No items found",
              textAlign: TextAlign.center,
              style: FontTextStyle.regular(
                  fontSize: FontSize.medium, color: ColorsApp.mainColorsApp.natural.shade700),
            ),
            const Sh40(),
          ],
        ),
      ),
    );
  }
}
