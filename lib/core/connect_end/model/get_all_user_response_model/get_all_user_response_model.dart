import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_user_response_model.g.dart';

@JsonSerializable()
class GetAllUserResponseModel {
  String? status;
  List<Datum>? data;

  GetAllUserResponseModel({this.status, this.data});

  factory GetAllUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllUserResponseModelToJson(this);
}
