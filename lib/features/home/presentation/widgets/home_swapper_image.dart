import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/core/widgets/sized_boxes/sw.dart';
import 'package:bund/core/widgets/swapper/bund_swapper.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/presentation/bloc/home_screen/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSwapperImage extends StatelessWidget {
  const HomeSwapperImage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    return SliverToBoxAdapter(
      child: BundSwapper<HomeModel>(
        fractionValue: 0.95,
        height: 156,
        item: homeScreenBloc.state.items,
        width: MediaQuery.of(context).size.width * 0.94,
        currentItemIndex: (index) {
          homeScreenBloc.add(ChangeBankIndex(index: index));
        },
        showItem: (home, index) {
          return Card(
            color: ColorsApp.mainColorsApp.containerColors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            elevation: 0.4,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8.0, top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Sh4(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "bünd",
                              style: FontTextStyle.bold(
                                fontSize: FontSize.heading_03,
                                color: ColorsApp.mainColorsApp.primary.shade100,
                              ),
                            ),
                            Text(
                              home.banner?.type ?? "",
                              style: FontTextStyle.regular(
                                fontSize: FontSize.heading_03,
                                color: ColorsApp.mainColorsApp.natural.shade300,
                              ),
                            )
                          ],
                        ),
                        const Sh12(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            color: ColorsApp.mainColorsApp.containerColors.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const ShowSvg(SvgImages.twoDirection),
                                  const SW4(),
                                  Text(
                                    "Start now",
                                    style: FontTextStyle.bold(
                                        fontSize: FontSize.small,
                                        color: ColorsApp.mainColorsApp.primary.shade100),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Sh16()
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Image.asset(home.banner?.image ?? ""),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
