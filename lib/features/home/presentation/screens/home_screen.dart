// ignore_for_file: prefer_const_constructors

import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/core/config/font_size/font_size.dart';
import 'package:bund/core/config/text_style/text_style.dart';
import 'package:bund/core/widgets/bloc_error/bloc_error.dart';
import 'package:bund/core/widgets/bund_app_bar.dart';
import 'package:bund/core/widgets/loading_bloc/loading_bloc.dart';
import 'package:bund/core/widgets/sized_boxes/sh.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';
import 'package:bund/features/home/presentation/bloc/home_screen/home_screen_bloc.dart';
import 'package:bund/features/home/presentation/widgets/home_conditions.dart';
import 'package:bund/features/home/presentation/widgets/home_screen_actions_app_bar.dart';
import 'package:bund/features/home/presentation/widgets/home_swapper_image.dart';
import 'package:bund/features/home/presentation/widgets/what_you_get.dart';
import 'package:bund/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc homeScreenBloc;

  @override
  void initState() {
    homeScreenBloc = serviceLocator<HomeScreenBloc>();
    homeScreenBloc.add(GetHomeScreenItems(getHomeUseCaseParam: GetHomeUseCaseParam()));
    super.initState();
  }

  static const edgeInsets = EdgeInsets.all(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BundAppBar(
        actions: [HomeScreenActionsAppBarItem()],
      ),
      body: BlocProvider<HomeScreenBloc>(
          create: (context) => homeScreenBloc,
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(builder: (context, state) {
            if (state.items.isEmpty) {
              if (state.getHomeDataStatus == GetHomeDataStatus.loading ||
                  state.getHomeDataStatus == GetHomeDataStatus.init) {
                return const LoadingBloc();
              } else if (state.getHomeDataStatus == GetHomeDataStatus.failed) {
                return BlocError.unkownError(clickActionFunction: () {
                  homeScreenBloc
                      .add(GetHomeScreenItems(getHomeUseCaseParam: GetHomeUseCaseParam()));
                });
              }
              return BlocError.noItems(clickActionFunction: () {
                homeScreenBloc.add(GetHomeScreenItems(getHomeUseCaseParam: GetHomeUseCaseParam()));
              });
            }
            return CustomScrollView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              // ignore: prefer_const_literals_to_create_immutables
              slivers: <Widget>[
                SliverToBoxAdapter(child: Sh8()),
                const HomeSwapperImage(),
                SliverToBoxAdapter(child: Sh16()),
                SliverToBoxAdapter(child: Padding(padding: edgeInsets, child: HomeConditions())),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: edgeInsets,
                    child: Text(
                      "What You Get",
                      style: FontTextStyle.bold(
                          fontSize: FontSize.medium,
                          color: ColorsApp.mainColorsApp.natural.shade700),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: const Sh8()),
                SliverPadding(padding: edgeInsets, sliver: WhatYouGet()),
              ],
            );
          })),
    );
  }
}
