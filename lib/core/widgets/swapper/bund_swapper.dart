import 'package:bund/core/widgets/swapper/swapper_circle_indicator.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class BundSwapper<T> extends StatelessWidget {
  final double height;
  final double width;
  final double fractionValue;
  final SwiperLayout swiperLayout;
  final SwiperController? swiperController;
  final List<T> item;
  final Function(T item, int index) showItem;
  final bool autoPlay;
  final bool withLoop;
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  final bool indicatorInTheCenter;
  final CustomLayoutOption? customLayoutOption;
  final bool showBottomCircle;
  final Function(int index)? changeCurrentItemIndex;
  final Function(int index)? currentItemIndex;
  BundSwapper(
      {Key? key,
      this.showBottomCircle = true,
      this.customLayoutOption,
      this.changeCurrentItemIndex,
      required this.item,
      required this.height,
      required this.width,
      required this.showItem,
      this.swiperLayout = SwiperLayout.DEFAULT,
      this.autoPlay = false,
      this.withLoop = true,
      this.fractionValue = 0.8,
      this.indicatorInTheCenter = false,
      this.currentItemIndex,
      this.swiperController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: swiperLayout != SwiperLayout.CUSTOM ? width : null,
          height: swiperLayout != SwiperLayout.CUSTOM ? height : null,
          child: Swiper(
            layout: swiperLayout,
            loop: withLoop,
            itemBuilder: (BuildContext context, int index) {
              return showItem(item[index], index);
            },
            customLayoutOption: customLayoutOption,
            autoplay: autoPlay,
            itemCount: item.length,
            itemHeight: height,
            itemWidth: width,
            scrollDirection: Axis.horizontal,
            controller: swiperController,
            physics: const BouncingScrollPhysics(),
            onIndexChanged: (index) {
              currentIndex.value = index;
              if (currentItemIndex != null) currentItemIndex!(index);
            },
            viewportFraction: fractionValue,
          ),
        ),
        if (showBottomCircle)
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: (context, currentIndex, _) {
              if (scrollController.hasClients) {
                if (scrollController.hasClients) {
                  double scrollValue = currentIndex * 4.5 + (12 * currentIndex).toDouble();
                  scrollController.animateTo(
                    currentIndex == 0
                        ? 0
                        : (scrollController.position.maxScrollExtent < scrollValue)
                            ? scrollController.position.maxScrollExtent
                            : scrollValue,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
              }
              return SwapperCircleIndicator<T>(
                items: item,
                currentIndex: currentIndex,
                indicatorInTheCenter: indicatorInTheCenter,
                scrollController: scrollController,
              );
            },
          ),
      ],
    );
  }
}
