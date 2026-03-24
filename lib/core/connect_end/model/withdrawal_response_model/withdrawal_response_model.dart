import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'withdrawal_response_model.g.dart';

@JsonSerializable()
class WithdrawalResponseModel {
  String? status;
  Data? data;

  WithdrawalResponseModel({this.status, this.data});

  factory WithdrawalResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WithdrawalResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WithdrawalResponseModelToJson(this);
}
