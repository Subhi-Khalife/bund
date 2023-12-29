part of 'main_screen_bloc.dart';

class MainScreenEvent {}

class ChangeIndex extends MainScreenEvent {
  int index;
  ChangeIndex({required this.index});
}

