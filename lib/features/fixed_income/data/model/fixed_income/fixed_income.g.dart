// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_income.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedIncomeModel _$FixedIncomeModelFromJson(Map<String, dynamic> json) =>
    FixedIncomeModel(
      annualInterest: (json['annualInterest'] as num?)?.toDouble(),
      annualYieldToMaturity:
          (json['annualYieldToMaturity'] as num?)?.toDouble(),
      averageMaturityDate: (json['averageMaturityDate'] as num?)?.toDouble(),
      averageRating: json['averageRating'] as String?,
      bonds: (json['bonds'] as List<dynamic>?)
          ?.map((e) => BondsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bondsNumbers: json['bondsNumbers'] as int?,
      capitalAtMaturity: (json['capitalAtMaturity'] as num?)?.toDouble(),
      investmentAmount: (json['investmentAmount'] as num?)?.toDouble(),
      termTypes: (json['termTypes'] as List<dynamic>?)
          ?.map((e) => TermModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalInterest: (json['totalInterest'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FixedIncomeModelToJson(FixedIncomeModel instance) =>
    <String, dynamic>{
      'bonds': instance.bonds,
      'annualYieldToMaturity': instance.annualYieldToMaturity,
      'averageRating': instance.averageRating,
      'bondsNumbers': instance.bondsNumbers,
      'termTypes': instance.termTypes,
      'investmentAmount': instance.investmentAmount,
      'capitalAtMaturity': instance.capitalAtMaturity,
      'totalInterest': instance.totalInterest,
      'annualInterest': instance.annualInterest,
      'averageMaturityDate': instance.averageMaturityDate,
    };
