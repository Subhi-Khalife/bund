import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/core/widgets/icnreament_button.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/presentation/blocs/fixed_income/fixed_income_bloc.dart';
import 'package:bund/features/fixed_income/presentation/widgets/term_types_list_items.dart';
import 'package:bund/features/fixed_income/presentation/widgets/title_with_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestmentCalculator extends StatelessWidget {
  const InvestmentCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    FixedIncomeModel fixedIncomeModel =
        BlocProvider.of<FixedIncomeBloc>(context).state.fixedIncomeModel ?? FixedIncomeModel();

    return BlocBuilder<FixedIncomeBloc, FixedIncomeState>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Container(
              color: ColorsApp.mainColorsApp.containerColors,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Sh16(),
                    Text(
                      "Investment Amount",
                      style: FontTextStyle.light(
                        fontSize: FontSize.copy,
                        color: ColorsApp.mainColorsApp.natural.shade500,
                      ),
                    ),
                    const Sh16(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IncreaseOrDecreaseButton(
                          imagePath: SvgImages.minus,
                          onClick: () {
                            BlocProvider.of<FixedIncomeBloc>(context)
                                .add(DicreaseInvestmentValue());
                          },
                        ),
                        Flexible(
                          child: Text(
                            "\$ ${fixedIncomeModel.investmentAmount}",
                            style: FontTextStyle.boldItalic(
                                fontSize: FontSize.heading_04,
                                color: ColorsApp.mainColorsApp.primary),
                          ),
                        ),
                        IncreaseOrDecreaseButton(
                          imagePath: SvgImages.plus,
                          onClick: () {
                            BlocProvider.of<FixedIncomeBloc>(context)
                                .add(IncreaseInvestmentValue());
                          },
                        )
                      ],
                    ),
                    const Sh16(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: ColorsApp.mainColorsApp.secondary.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
                              child: Text(
                                "${fixedIncomeModel.annualYieldToMaturity}% YTM",
                                style: FontTextStyle.regular(
                                    fontSize: FontSize.small,
                                    color: ColorsApp.mainColorsApp.secondary),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Sh16(),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<FixedIncomeBloc>(context)
                                  .add(UpdateTermIndex(termIndex: index));
                            },
                            child: TermTypesListItem(
                              termModel: fixedIncomeModel.termTypes![index],
                              backGroundColor:
                                  ColorsApp.mainColorsApp.primary.shade100.withOpacity(0.05),
                              isActive: state.termIndex == index,
                            ),
                          );
                        },
                        itemCount: fixedIncomeModel.termTypes?.length ?? 0,
                      ),
                    ),
                    const Sh24(),
                    Row(
                      children: [
                        Expanded(
                            child: TitleWithDescription(
                          description: "\$${fixedIncomeModel.capitalAtMaturity} ",
                          title: "Capital At Maturity",
                        )),
                        Expanded(
                          child: TitleWithDescription(
                            description: "\$${fixedIncomeModel.totalInterest}",
                            title: "Total Interest",
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        )
                      ],
                    ),
                    const Sh16(),
                    Row(
                      children: [
                        Expanded(
                            child: TitleWithDescription(
                                description: "\$${fixedIncomeModel.annualInterest}",
                                title: "Annual Interest")),
                        Expanded(
                          child: TitleWithDescription(
                            description: "${fixedIncomeModel.averageMaturityDate}",
                            title: "Average Maturity Date ",
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        )
                      ],
                    ),
                    const Sh24(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
