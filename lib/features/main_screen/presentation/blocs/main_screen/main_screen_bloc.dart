import 'package:bloc/bloc.dart';
import 'package:bund/core/constant/images/svg_images.dart';
import 'package:bund/features/fixed_income/presentation/screens/fixed_income_screen.dart';
import 'package:bund/features/home/presentation/screens/home_screen.dart';
import 'package:bund/features/main_screen/utilities/botton_navigation_bar_list_items.dart';
import 'package:flutter/material.dart';
part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  static List<BottomNavigationBarListItem> items(int activeIndex) => [
        BottomNavigationBarListItem(
          imagePath: BottomNavigationBarItems.home.getImage,
          isActive: activeIndex == BottomNavigationBarItems.home.index,
          screen: const HomeScreen(),
          title: BottomNavigationBarItems.home.name,
          currentIndex: BottomNavigationBarItems.home.index,
        ),
        BottomNavigationBarListItem(
          imagePath: BottomNavigationBarItems.investment.getImage,
          isActive: activeIndex == BottomNavigationBarItems.investment.index,
          screen: const FixedIncomeScreen(),
          title: BottomNavigationBarItems.investment.getTitle,
          currentIndex: BottomNavigationBarItems.investment.index,
        ),
        BottomNavigationBarListItem(
          imagePath: BottomNavigationBarItems.chat.getImage,
          isActive: activeIndex == BottomNavigationBarItems.chat.index,
          screen: Container(),
          title: BottomNavigationBarItems.chat.getTitle,
          currentIndex: BottomNavigationBarItems.chat.index,
        ),
      ];

  MainScreenBloc() : super(MainScreenState()) {
    on<MainScreenEvent>((event, emit) {
      state.items = items(0);
      state.selectedIndex = 0;
      emit(state);
    });

    on<ChangeIndex>(_mapChangeIndex);
  }

  _mapChangeIndex(ChangeIndex event, Emitter<MainScreenState> emit) {
    state.items[state.selectedIndex].isActive = false;
    state.items[event.index].isActive = true;
    emit(state.copyWith(selectedIndex: event.index, items: items(event.index)));
  }
}
