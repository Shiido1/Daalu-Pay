import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'registration_response_model.g.dart';

@JsonSerializable()
class RegistrationResponseModel {
  String? status;
  Data? data;

  RegistrationResponseModel({this.status, this.data});

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RegistrationResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegistrationResponseModelToJson(this);
}
