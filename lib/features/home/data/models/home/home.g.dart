// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      bankSpecialItems: (json['bankSpecialItems'] as List<dynamic>?)
          ?.map(
              (e) => BankSpecialItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      banner: json['banner'] == null
          ? null
          : BannerModel.fromJson(json['banner'] as Map<String, dynamic>),
      conditionsModel: json['conditionsModel'] == null
          ? null
          : ConditionsModel.fromJson(
              json['conditionsModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'banner': instance.banner,
      'bankSpecialItems': instance.bankSpecialItems,
      'conditionsModel': instance.conditionsModel,
    };
