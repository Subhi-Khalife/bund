import 'package:bloc/bloc.dart';
import 'package:bund/features/home/data/models/home/home.dart';
import 'package:bund/features/home/domain/use_case/get_home_use_case.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetHomeUseCase getHomeUseCase;
  HomeScreenBloc({required this.getHomeUseCase}) : super(HomeScreenState()) {
    on<HomeScreenEvent>((event, emit) {});
    on<GetHomeScreenItems>(_mapGetHomeScreenItems);
    on<ChangeBankIndex>(_mapChangeBankIndex);
  }
  _mapChangeBankIndex(ChangeBankIndex event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(index: event.index));
  }

  _mapGetHomeScreenItems(GetHomeScreenItems event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(getHomeDataStatus: GetHomeDataStatus.loading));
    final result = await getHomeUseCase(event.getHomeUseCaseParam);
    result.fold(
      (l) => emit(state.copyWith(getHomeDataStatus: GetHomeDataStatus.failed)),
      (r) => emit(state.copyWith(getHomeDataStatus: GetHomeDataStatus.success, items: r)),
    );
  }
}
