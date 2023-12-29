import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:flutter/material.dart';

class IconWithTitle extends StatelessWidget {
  final double? width;
  final double? height;
  final Function onClick;
  final bool isActive;
  final String title;
  final String imagePath;
  final int maxline;
  const IconWithTitle({
    super.key,
    this.height = 94,
    this.isActive = true,
    this.width,
    this.maxline = 2,
    required this.imagePath,
    required this.title,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: width,
        height: height,
        color: ColorsApp.mainColorsApp.containerColors.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 4.0, right: 4.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Sh8(),
              ShowSvg(
                imagePath,
                color: isActive
                    ? ColorsApp.mainColorsApp.natural.shade800.withOpacity(0.5)
                    : ColorsApp.mainColorsApp.natural.shade800.withOpacity(0.08),
                height: 28,
                width: 28,
              ),
              const Sh8(),
              Text(
                title,
                style: FontTextStyle.regular(
                  fontSize: FontSize.copy,
                  color: isActive
                      ? ColorsApp.mainColorsApp.natural.shade800.withOpacity(0.5)
                      : ColorsApp.mainColorsApp.natural.shade800.withOpacity(0.1),
                ),
                textAlign: TextAlign.center,
                maxLines: maxline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
