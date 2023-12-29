import 'package:json_annotation/json_annotation.dart';

part 'conditions.g.dart';

@JsonSerializable()
class ConditionsModel {
  ConditionsModel({
    this.minimumDepositValue,
    this.paidAnnualy,
  });
  double? minimumDepositValue;
  double? paidAnnualy;

  
  factory ConditionsModel.fromJson(Map<String, dynamic> json) {
    return _$ConditionsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConditionsModelToJson(this);
  }
}
