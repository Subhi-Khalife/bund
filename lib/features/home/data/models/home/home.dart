import 'package:bund/features/home/data/models/bank_special_items/back_special_items.dart';
import 'package:bund/features/home/data/models/banner/banner.dart';
import 'package:bund/features/home/data/models/conditions/conditions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';

@JsonSerializable()
class HomeModel {
  HomeModel({this.bankSpecialItems, this.banner, this.conditionsModel});
  BannerModel? banner;
  List<BankSpecialItemsModel>? bankSpecialItems;
  ConditionsModel ?conditionsModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}
