import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/core/widgets/sized_boxes/sw.dart';
import 'package:bund/features/fixed_income/data/model/bonds/bonds.dart';
import 'package:bund/features/fixed_income/presentation/blocs/fixed_income/fixed_income_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BondsList extends StatelessWidget {
  const BondsList({super.key});

  @override
  Widget build(BuildContext context) {
    FixedIncomeBloc fixedIncomeBloc = BlocProvider.of<FixedIncomeBloc>(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          BondsModel bond = fixedIncomeBloc.state.fixedIncomeModel?.bonds![index] ?? BondsModel();
          return ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Container(
              color: ColorsApp.mainColorsApp.containerColors,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Sh8(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorsApp.mainColorsApp.primary.withOpacity(0.05),
                                maxRadius: 24,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(230),
                                  child: Image.asset(
                                    bond.image ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SW8(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bond.title ?? "",
                                    style: FontTextStyle.bold(
                                        fontSize: FontSize.medium,
                                        color: ColorsApp.mainColorsApp.natural.shade800),
                                  ),
                                  Text(
                                    bond.description ?? "",
                                    style: FontTextStyle.regular(
                                        fontSize: FontSize.copy,
                                        color: ColorsApp.mainColorsApp.natural.shade600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Text(
                            "5.37% APY",
                            style: FontTextStyle.bold(
                              fontSize: FontSize.small,
                              color: ColorsApp.mainColorsApp.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Sh8(),
                ],
              ),
            ),
          );
        },
        childCount: fixedIncomeBloc.state.fixedIncomeModel?.bonds?.length ?? 0,
      ),
    );
  }
}
