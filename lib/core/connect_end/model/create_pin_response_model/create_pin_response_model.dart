import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_pin_response_model.g.dart';

@JsonSerializable()
class CreatePinResponseModel {
  String? status;
  Data? data;

  CreatePinResponseModel({this.status, this.data});

  factory CreatePinResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CreatePinResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatePinResponseModelToJson(this);
}
