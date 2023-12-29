part of 'home_screen_bloc.dart';

enum GetHomeDataStatus { init, loading, success, failed }

class HomeScreenState {
  final GetHomeDataStatus getHomeDataStatus;
  final List<HomeModel> items;
  final int index;
  HomeScreenState({
    this.getHomeDataStatus = GetHomeDataStatus.init,
    this.items = const <HomeModel>[],
    this.index = 0,
  });

  HomeScreenState copyWith({
    GetHomeDataStatus? getHomeDataStatus,
    List<HomeModel>? items,
    int? index,
  }) {
    return HomeScreenState(
      getHomeDataStatus: getHomeDataStatus ?? this.getHomeDataStatus,
      items: items ?? this.items,
      index: index ?? this.index,
    );
  }
}
