import 'package:bund/core/config/color/colors_app.dart';
import 'package:flutter/material.dart';
import '../../constant/design/constant.dart';

class SwapperCircleIndicator<T> extends StatelessWidget {
  final List<T> items;
  final int currentIndex;
  final bool indicatorInTheCenter;
  final ScrollController scrollController;
  const SwapperCircleIndicator({
    required this.items,
    required this.currentIndex,
    required this.indicatorInTheCenter,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: kshSizeHeight32,
        color: Colors.white12,
        child: ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (contex, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: currentIndex != index
                    ? ColorsApp.mainColorsApp.natural.shade300.withOpacity(0.4)
                    : ColorsApp.mainColorsApp.primary,
                minRadius: 4,
              ),
            );
          },
        ),
      ),
    );
  }
}
