// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/app_button.dart';
import 'package:bund/core/widgets/bloc_error/bloc_error.dart';
import 'package:bund/core/widgets/bund_app_bar.dart';
import 'package:bund/core/widgets/loading_bloc/loading_bloc.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';
import 'package:bund/features/fixed_income/presentation/blocs/fixed_income/fixed_income_bloc.dart';
import 'package:bund/features/fixed_income/presentation/widgets/annual_yield_to_maturity.dart';
import 'package:bund/features/fixed_income/presentation/widgets/avarage_rating_with_bond.dart';
import 'package:bund/features/fixed_income/presentation/widgets/bonds_list.dart';
import 'package:bund/features/fixed_income/presentation/widgets/header_fixed_income_title.dart';
import 'package:bund/features/fixed_income/presentation/widgets/investment_calculator.dart';
import 'package:bund/features/fixed_income/presentation/widgets/term_types_list.dart';
import 'package:bund/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FixedIncomeScreen extends StatefulWidget {
  const FixedIncomeScreen({super.key});

  @override
  State<FixedIncomeScreen> createState() => _FixedIncomeScreenState();
}

class _FixedIncomeScreenState extends State<FixedIncomeScreen> {
  late FixedIncomeBloc fixedIncomeBloc;
  @override
  void initState() {
    fixedIncomeBloc = serviceLocator<FixedIncomeBloc>();
    fixedIncomeBloc.add(GetFixedInput(getFixedIncomeUseCaseParam: GetFixedIncomeUseCaseParam()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BundAppBar(
        appBarLeadingWidget: AppBarLeadingWidget.backIcon,
        title: "Fixed Income",
      ),
      body: BlocProvider<FixedIncomeBloc>(
        create: (context) => fixedIncomeBloc,
        child: BlocBuilder<FixedIncomeBloc, FixedIncomeState>(
          buildWhen: (c, l) => c.getFixedIncomStatus != l.getFixedIncomStatus,
          builder: (context, state) {
            if (state.getFixedIncomStatus == GetFixedIncomStatus.loading ||
                state.getFixedIncomStatus == GetFixedIncomStatus.init) {
              return LoadingBloc();
            } else if (state.getFixedIncomStatus == GetFixedIncomStatus.failed) {
              BlocError.unkownError(clickActionFunction: () {
                fixedIncomeBloc
                    .add(GetFixedInput(getFixedIncomeUseCaseParam: GetFixedIncomeUseCaseParam()));
              });
            }
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(child: Sh16()),
                  HeaderFixedIncomeTitle(),
                  SliverToBoxAdapter(child: Sh16()),
                  AnnualYieldToMaturity(),
                  SliverToBoxAdapter(child: Sh8()),
                  AvarageRatingWithBonds(),
                  SliverToBoxAdapter(child: Sh24()),
                  SliverToBoxAdapter(
                    child: Text(
                      "Term Types",
                      style: FontTextStyle.regular(
                          fontSize: FontSize.copy, color: ColorsApp.mainColorsApp.natural.shade500),
                    ),
                  ),
                  SliverToBoxAdapter(child: Sh8()),
                  TermsTypesList(),
                  SliverToBoxAdapter(child: Sh32()),
                  SliverToBoxAdapter(
                    child: Text(
                      "Investment Calculator",
                      style: FontTextStyle.bold(
                          fontSize: FontSize.medium,
                          color: ColorsApp.mainColorsApp.primary.shade100),
                    ),
                  ),
                  SliverToBoxAdapter(child: Sh16()),
                  InvestmentCalculator(),
                  SliverToBoxAdapter(child: Sh16()),
                  SliverToBoxAdapter(
                    child: Text(
                      "Bonds",
                      style: FontTextStyle.bold(
                          fontSize: FontSize.medium,
                          color: ColorsApp.mainColorsApp.primary.shade100),
                    ),
                  ),
                  SliverToBoxAdapter(child: Sh16()),
                  BondsList(),
                  SliverToBoxAdapter(child: Sh16()),
                  SliverToBoxAdapter(child: AppButton(buttonText: "Create Investment Account")),
                  SliverToBoxAdapter(child: Sh16()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
