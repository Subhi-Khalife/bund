import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerModel {
  BannerModel({this.image, this.type});
  String? image;
  String? type;

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return _$BannerModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BannerModelToJson(this);
  }
}
