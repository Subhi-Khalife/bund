part of 'fixed_income_bloc.dart';

class FixedIncomeEvent {}

class GetFixedInput extends FixedIncomeEvent {
  final GetFixedIncomeUseCaseParam getFixedIncomeUseCaseParam;
  GetFixedInput({required this.getFixedIncomeUseCaseParam});
}

class UpdateTermIndex extends FixedIncomeEvent {
  final int termIndex;
  UpdateTermIndex({required this.termIndex});
}

class UpdateInvestmentValue extends FixedIncomeEvent {}

class IncreaseInvestmentValue extends FixedIncomeEvent {}

class DicreaseInvestmentValue extends FixedIncomeEvent {}
