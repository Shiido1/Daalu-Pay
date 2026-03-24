import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'preference_response_model.g.dart';

@JsonSerializable()
class PreferenceResponseModel {
  String? status;
  Data? data;

  PreferenceResponseModel({this.status, this.data});

  factory PreferenceResponseModel.fromJson(Map<String, dynamic> json) {
    return _$PreferenceResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PreferenceResponseModelToJson(this);
}
