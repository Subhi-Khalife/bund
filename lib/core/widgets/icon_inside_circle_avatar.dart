import 'dart:async';

import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:flutter/material.dart';

class IconInsideCirclAvatat extends StatefulWidget {
  final String imagePath;
  final Function? onClick;

  const IconInsideCirclAvatat({
    super.key,
    required this.imagePath,
    this.onClick,
  });

  @override
  State<IconInsideCirclAvatat> createState() => _IconInsideCirclAvatatState();
}

class _IconInsideCirclAvatatState extends State<IconInsideCirclAvatat> {
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick!();
      },
      onLongPress: () {
        _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
          widget.onClick!();
        });
      },
      onLongPressEnd: (_) {
        _timer?.cancel();
      },
      child: CircleAvatar(
        backgroundColor: ColorsApp.mainColorsApp.primary.shade100.withOpacity(0.1),
        child: ShowSvg(widget.imagePath),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
