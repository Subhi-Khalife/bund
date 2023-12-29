import 'package:json_annotation/json_annotation.dart';

part 'bonds.g.dart';

@JsonSerializable()
class BondsModel {
  BondsModel({this.description, this.image, this.title, this.value});
  String? image;
  String? title;
  String? description;
  String? value;

  factory BondsModel.fromJson(Map<String, dynamic> json) {
    return _$BondsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BondsModelToJson(this);
  }
}
