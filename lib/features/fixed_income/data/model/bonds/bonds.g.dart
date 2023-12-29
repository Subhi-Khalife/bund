// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BondsModel _$BondsModelFromJson(Map<String, dynamic> json) => BondsModel(
      description: json['description'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$BondsModelToJson(BondsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
    };
