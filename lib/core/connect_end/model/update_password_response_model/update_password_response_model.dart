import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'update_password_response_model.g.dart';

@JsonSerializable()
class UpdatePasswordResponseModel {
  String? status;
  Data? data;

  UpdatePasswordResponseModel({this.status, this.data});

  factory UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UpdatePasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdatePasswordResponseModelToJson(this);
}
