import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  String? status;
  Data? data;

  UserResponseModel({this.status, this.data});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
