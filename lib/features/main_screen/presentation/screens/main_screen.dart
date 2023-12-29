import 'package:bund/core/config/color/colors_app.dart';
import 'package:bund/features/main_screen/presentation/blocs/main_screen/main_screen_bloc.dart';
import 'package:bund/features/main_screen/presentation/widget/bottom_navigation_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenBloc mainScreenBloc;
  @override
  void initState() {
    mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
    mainScreenBloc.add(MainScreenEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainScreenBloc>(
      create: (context) => mainScreenBloc,
      child: BlocBuilder<MainScreenBloc, MainScreenState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              height: 60,
              color: ColorsApp.mainColorsApp.containerColors,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8.0, right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...state.items
                        .map((e) => BottomNavigationBarItemsDesign(bottomNavigationBarListItem: e))
                        .toList()
                  ],
                ),
              ),
            ),
            body: state.items[state.selectedIndex].screen,
          );
        },
      ),
    );
  }
}
