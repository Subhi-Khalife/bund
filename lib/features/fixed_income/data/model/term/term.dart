import 'package:json_annotation/json_annotation.dart';

part 'term.g.dart';

@JsonSerializable()
class TermModel {
  TermModel({this.duration});
  int? duration;

  factory TermModel.fromJson(Map<String, dynamic> json) {
    return _$TermModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TermModelToJson(this);
  }
}
