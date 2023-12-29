import 'package:bund/features/home/data/models/bank_special_items/back_special_items.dart';
import 'package:bund/features/home/presentation/bloc/home_screen/home_screen_bloc.dart';
import 'package:bund/features/home/presentation/widgets/icon_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhatYouGet extends StatelessWidget {
  const WhatYouGet({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    List<BankSpecialItemsModel> bankSpecialItems =
        homeScreenBloc.state.items[homeScreenBloc.state.index].bankSpecialItems ?? [];
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: (MediaQuery.of(context).size.width * 0.0265) / 8.1),
      itemBuilder: (context, index) {
        return IconWithTitle(
          imagePath: bankSpecialItems[index].image ?? "",
          title: bankSpecialItems[index].title ?? "",
          onClick: () {},
          width: MediaQuery.of(context).size.width * 0.265,
          isActive: bankSpecialItems[index].isActive ?? false,
        );
      },
      itemCount: bankSpecialItems.length,
    );
  }
}
