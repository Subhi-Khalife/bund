import 'package:bloc/bloc.dart';
import 'package:bund/features/fixed_income/data/model/fixed_income/fixed_income.dart';
import 'package:bund/features/fixed_income/domain/use_cases/get_fixed_income_use_case.dart';

part 'fixed_income_event.dart';
part 'fixed_income_state.dart';

class FixedIncomeBloc extends Bloc<FixedIncomeEvent, FixedIncomeState> {
  final GetFixedIncomeUseCase getFixedIncomeUseCase;
  FixedIncomeBloc({required this.getFixedIncomeUseCase}) : super(FixedIncomeState()) {
    on<FixedIncomeEvent>((event, emit) {});
    on<GetFixedInput>(_mapGetFixedInput);
    on<UpdateTermIndex>(_mapUpdateTermIndex);
    on<UpdateInvestmentValue>(_mapUpdateInvestmentValue);
    on<IncreaseInvestmentValue>(_mapIncreaseInvestmentValue);
    on<DicreaseInvestmentValue>(_mapDicreaseInvestmentValue);
  }

  _mapDicreaseInvestmentValue(DicreaseInvestmentValue event, Emitter<FixedIncomeState> emit) {
    double currentAmuntValue = state.fixedIncomeModel?.investmentAmount ?? 0;
    if (currentAmuntValue - 1000 >= 250) {
      currentAmuntValue -= 1000;
    }
    state.fixedIncomeModel?.investmentAmount = currentAmuntValue;
    emit(state.copyWith(fixedIncomeModel: state.fixedIncomeModel));
    add(UpdateInvestmentValue());
  }

  _mapIncreaseInvestmentValue(IncreaseInvestmentValue event, Emitter<FixedIncomeState> emit) {
    double currentAmuntValue = state.fixedIncomeModel?.investmentAmount ?? 0;
    if (currentAmuntValue <= 10000) {
      currentAmuntValue += 1000;
    } else {
      currentAmuntValue += 10000;
    }
    state.fixedIncomeModel?.investmentAmount = currentAmuntValue;
    add(UpdateInvestmentValue());
  }

  _mapUpdateInvestmentValue(UpdateInvestmentValue event, Emitter<FixedIncomeState> emit) {
    double capitalAtMaturity = ((state.fixedIncomeModel?.annualYieldToMaturity ?? 0.0) *
            (state.fixedIncomeModel?.termTypes![state.termIndex].duration ?? 0.0) *
            (state.fixedIncomeModel?.investmentAmount ?? 0.0)) +
        (state.fixedIncomeModel?.investmentAmount ?? 0.0);

    double totalInterest = ((state.fixedIncomeModel?.annualYieldToMaturity ?? 0.0) *
        (state.fixedIncomeModel?.termTypes![state.termIndex].duration ?? 0.0) *
        (state.fixedIncomeModel?.investmentAmount ?? 0.0));

    double annualInterest = (state.fixedIncomeModel?.investmentAmount ?? 0.0) *
        (state.fixedIncomeModel?.annualYieldToMaturity ?? 0.0);

    state.fixedIncomeModel?.annualInterest = annualInterest;
    state.fixedIncomeModel?.totalInterest = totalInterest;
    state.fixedIncomeModel?.capitalAtMaturity = capitalAtMaturity;
    emit(state.copyWith(fixedIncomeModel: state.fixedIncomeModel));
  }

  _mapUpdateTermIndex(UpdateTermIndex event, Emitter<FixedIncomeState> emit) async {
    if (event.termIndex != state.termIndex) {
      state.termIndex = event.termIndex;
      add(UpdateInvestmentValue());
    }
  }

  _mapGetFixedInput(GetFixedInput event, Emitter<FixedIncomeState> emit) async {
    emit(state.copyWith(getFixedIncomStatus: GetFixedIncomStatus.loading));
    final result = await getFixedIncomeUseCase(event.getFixedIncomeUseCaseParam);
    result.fold(
      (l) => emit(state.copyWith(getFixedIncomStatus: GetFixedIncomStatus.failed)),
      (r) => emit(state.copyWith(
          getFixedIncomStatus: GetFixedIncomStatus.success, fixedIncomeModel: r, termIndex: 0)),
    );
    add(UpdateInvestmentValue());
  }
}
