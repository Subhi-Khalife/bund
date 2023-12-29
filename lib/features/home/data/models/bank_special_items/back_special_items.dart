import 'package:json_annotation/json_annotation.dart';

part 'back_special_items.g.dart';

@JsonSerializable()
class BankSpecialItemsModel {
  BankSpecialItemsModel({this.image, this.title,this.isActive,});
  String? title;
  String? image;
  bool ? isActive;

  factory BankSpecialItemsModel.fromJson(Map<String, dynamic> json) {
    return _$BankSpecialItemsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BankSpecialItemsModelToJson(this);
  }
}
