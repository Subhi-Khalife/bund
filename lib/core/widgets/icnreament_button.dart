import 'dart:async';

import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:flutter/material.dart';

Timer? _timer;
// ignore: must_be_immutable
class IncreaseOrDecreaseButton extends StatelessWidget {
  final Function onClick;
  final String imagePath;

  IncreaseOrDecreaseButton({
    super.key,
    required this.onClick,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      onLongPress: () {
        _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
          onClick();
        });
      },
      onLongPressEnd: (_) {
        _timer?.cancel();
      },
      child: CircleAvatar(
        backgroundColor: ColorsApp.mainColorsApp.primary.shade100.withOpacity(0.1),
        child: ShowSvg(imagePath),
      ),
    );
  }
}
