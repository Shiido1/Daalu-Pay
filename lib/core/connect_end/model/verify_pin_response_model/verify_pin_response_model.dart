import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'verify_pin_response_model.g.dart';

@JsonSerializable()
class VerifyPinResponseModel {
  String? status;
  Data? data;

  VerifyPinResponseModel({this.status, this.data});

  factory VerifyPinResponseModel.fromJson(Map<String, dynamic> json) {
    return _$VerifyPinResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyPinResponseModelToJson(this);
}
