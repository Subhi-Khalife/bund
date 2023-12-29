import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

class DesignHelper {
  static final cardSwapperCustomPaintOption = CustomLayoutOption(startIndex: -1, stateCount: 3)
    ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
    ..addTranslate(const [Offset(-180.0, -15.0), Offset(0.0, 0.0), Offset(180.0, -15.0)])
    ..addScale([0.7, 0.9, 0.7], Alignment.center);

  static double screenPadding = 12;

  static const int maxPaginationNumber = 10;

  static int calcPaginationOffset({required List<dynamic> itemsCount}) {
    return itemsCount.length;
  }
}
