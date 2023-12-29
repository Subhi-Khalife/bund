part of 'fixed_income_bloc.dart';

enum GetFixedIncomStatus { init, loading, success, failed }

class FixedIncomeState {
  final GetFixedIncomStatus getFixedIncomStatus;
  final FixedIncomeModel? fixedIncomeModel;
  int termIndex;
  FixedIncomeState({
    this.termIndex = 0,
    this.getFixedIncomStatus = GetFixedIncomStatus.init,
    this.fixedIncomeModel,
  });

  FixedIncomeState copyWith({
    GetFixedIncomStatus? getFixedIncomStatus,
    FixedIncomeModel? fixedIncomeModel,
    int? termIndex,
  }) {
    return FixedIncomeState(
      termIndex: termIndex ?? this.termIndex,
      fixedIncomeModel: fixedIncomeModel ?? this.fixedIncomeModel,
      getFixedIncomStatus: getFixedIncomStatus ?? this.getFixedIncomStatus,
    );
  }
}
