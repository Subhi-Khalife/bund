import 'package:bund/features/fixed_income/data/model/bonds/bonds.dart';
import 'package:bund/features/fixed_income/data/model/term/term.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fixed_income.g.dart';

@JsonSerializable()
class FixedIncomeModel {
  FixedIncomeModel({
    this.annualInterest,
    this.annualYieldToMaturity,
    this.averageMaturityDate,
    this.averageRating,
    this.bonds,
    this.bondsNumbers,
    this.capitalAtMaturity,
    this.investmentAmount,
    this.termTypes,
    this.totalInterest,
  });
  List<BondsModel>? bonds;
  double? annualYieldToMaturity;
  String? averageRating;
  int? bondsNumbers;
  List<TermModel>? termTypes;
  double? investmentAmount;
  double? capitalAtMaturity;
  double? totalInterest;
  double? annualInterest;
  double? averageMaturityDate;
  factory FixedIncomeModel.fromJson(Map<String, dynamic> json) {
    return _$FixedIncomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FixedIncomeModelToJson(this);
  }
}
