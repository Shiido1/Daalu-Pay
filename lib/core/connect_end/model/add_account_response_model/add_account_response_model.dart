import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'add_account_response_model.g.dart';

@JsonSerializable()
class AddAccountResponseModel {
  String? status;
  Data? data;

  AddAccountResponseModel({this.status, this.data});

  factory AddAccountResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AddAccountResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddAccountResponseModelToJson(this);
}
