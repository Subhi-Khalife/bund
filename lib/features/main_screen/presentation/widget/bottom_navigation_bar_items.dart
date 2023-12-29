import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/show_svg.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/features/main_screen/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:bund/features/main_screen/utilities/botton_navigation_bar_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarItemsDesign extends StatelessWidget {
  final BottomNavigationBarListItem bottomNavigationBarListItem;
  const BottomNavigationBarItemsDesign({
    super.key,
    required this.bottomNavigationBarListItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MainScreenBloc>(context)
            .add(ChangeIndex(index: bottomNavigationBarListItem.currentIndex));
      },
      child: Column(
        children: [
          ShowSvg(
            bottomNavigationBarListItem.imagePath,
            color: bottomNavigationBarListItem.isActive
                ? ColorsApp.mainColorsApp.primary
                : ColorsApp.mainColorsApp.natural.shade300,
            width: 18,
            height: 18,
          ),
          const Sh4(),
          Text(
            bottomNavigationBarListItem.title,
            style: FontTextStyle.regular(
              fontSize: FontSize.copy,
              color: bottomNavigationBarListItem.isActive
                  ? ColorsApp.mainColorsApp.primary
                  : ColorsApp.mainColorsApp.natural.shade300,
            ),
          )
        ],
      ),
    );
  }
}
