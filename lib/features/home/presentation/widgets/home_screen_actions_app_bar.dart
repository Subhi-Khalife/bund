import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:bund/core/widgets/sized_boxes/sw.dart';
import 'package:flutter/material.dart';

class HomeScreenActionsAppBarItem extends StatelessWidget {
  const HomeScreenActionsAppBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsApp.mainColorsApp.natural.shade50,
                  child: const ShowSvg(SvgImages.person),
                ),
                const SW8(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: FontTextStyle.regular(
                          fontSize: FontSize.copy, color: ColorsApp.mainColorsApp.natural.shade700),
                    ),
                    Text(
                      "Mehemet Taser",
                      style: FontTextStyle.bold(
                          fontSize: FontSize.copy, color: ColorsApp.mainColorsApp.primary),
                    )
                  ],
                ),
              ],
            ),
            CircleAvatar(
                backgroundColor: ColorsApp.mainColorsApp.natural.shade50,
                child: ShowSvg(
                  SvgImages.notification,
                  color: ColorsApp.mainColorsApp.primary,
                )),
          ],
        ),
      ),
    );
  }
}
