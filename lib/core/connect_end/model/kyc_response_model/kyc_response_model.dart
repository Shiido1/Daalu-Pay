import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'kyc_response_model.g.dart';

@JsonSerializable()
class KycResponseModel {
  String? status;
  Data? data;

  KycResponseModel({this.status, this.data});

  factory KycResponseModel.fromJson(Map<String, dynamic> json) {
    return _$KycResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycResponseModelToJson(this);
}
