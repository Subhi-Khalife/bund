import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/core/widgets/sized_boxes/sw.dart';
import 'package:bund/features/home/data/models/conditions/conditions.dart';
import 'package:bund/features/home/presentation/bloc/home_screen/home_screen_bloc.dart';
import 'package:bund/features/home/presentation/widgets/icon_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeConditions extends StatelessWidget {
  const HomeConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    ConditionsModel conditionsModel =
        homeScreenBloc.state.items[homeScreenBloc.state.index].conditionsModel ?? ConditionsModel();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Conditions",
          style: FontTextStyle.bold(
              fontSize: FontSize.medium, color: ColorsApp.mainColorsApp.natural.shade700),
        ),
        const Sh16(),
        Row(
          children: [
            Expanded(
              child: IconWithTitle(
                imagePath: SvgImages.noMinimumDeposit,
                onClick: () {},
                title: conditionsModel.minimumDepositValue == null
                    ? "No Minimum Deposit"
                    : "\$${conditionsModel.minimumDepositValue.toString()} Minimum",
                height: 80,
                maxline: 1,
              ),
            ),
            const SW8(),
            Expanded(
              child: IconWithTitle(
                imagePath: SvgImages.bank,
                onClick: () {},
                title: conditionsModel.paidAnnualy == null
                    ? "No Monthly Subscription"
                    : "\$${conditionsModel.paidAnnualy.toString()}/Montht(Paid Annually)",
                maxline: 1,
                height: 80,
              ),
            )
          ],
        ),
      ],
    );
  }
}
