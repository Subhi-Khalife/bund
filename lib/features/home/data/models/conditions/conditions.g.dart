// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionsModel _$ConditionsModelFromJson(Map<String, dynamic> json) =>
    ConditionsModel(
      minimumDepositValue: json['minimumDepositValue'] as double?,
      paidAnnualy: json['paidAnnualy'] as double?,
    );

Map<String, dynamic> _$ConditionsModelToJson(ConditionsModel instance) =>
    <String, dynamic>{
      'minimumDepositValue': instance.minimumDepositValue,
      'paidAnnualy': instance.paidAnnualy,
    };
