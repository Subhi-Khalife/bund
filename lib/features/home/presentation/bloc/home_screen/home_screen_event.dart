part of 'home_screen_bloc.dart';

class HomeScreenEvent {}

class GetHomeScreenItems extends HomeScreenEvent {
  final GetHomeUseCaseParam getHomeUseCaseParam;
  GetHomeScreenItems({required this.getHomeUseCaseParam});
}

class ChangeBankIndex extends HomeScreenEvent {
  final int index;
  ChangeBankIndex({required this.index});
}
