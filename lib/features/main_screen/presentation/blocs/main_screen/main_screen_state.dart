part of 'main_screen_bloc.dart';

enum BottomNavigationBarItems { home, investment, chat }

extension on BottomNavigationBarItems {
  String get getTitle {
    switch (this) {
      case BottomNavigationBarItems.home:
        return "Home";
      case BottomNavigationBarItems.investment:
        return "Investment";
      case BottomNavigationBarItems.chat:
        return "Chat";
    }
  }

  String get getImage {
    switch (this) {
      case BottomNavigationBarItems.home:
        return SvgImages.home;
      case BottomNavigationBarItems.investment:
        return SvgImages.moneyTrade;
      case BottomNavigationBarItems.chat:
        return SvgImages.conversation;
    }
  }
}

class MainScreenState {
  BottomNavigationBarItems bottomNavigationBarItems;
  List<BottomNavigationBarListItem> items;
  int selectedIndex;
  MainScreenState({
    this.selectedIndex = 0,
    this.bottomNavigationBarItems = BottomNavigationBarItems.home,
    this.items = const <BottomNavigationBarListItem>[],
  });

  MainScreenState copyWith({
    BottomNavigationBarItems? bottomNavigationBarItems,
    List<BottomNavigationBarListItem>? items,
    int? selectedIndex,
  }) {
    return MainScreenState(
      bottomNavigationBarItems: bottomNavigationBarItems ?? this.bottomNavigationBarItems,
      items: items ?? this.items,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
