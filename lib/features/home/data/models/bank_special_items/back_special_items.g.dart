// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'back_special_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankSpecialItemsModel _$BankSpecialItemsModelFromJson(
        Map<String, dynamic> json) =>
    BankSpecialItemsModel(
      image: json['image'] as String?,
      title: json['title'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$BankSpecialItemsModelToJson(
        BankSpecialItemsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'isActive': instance.isActive,
    };
