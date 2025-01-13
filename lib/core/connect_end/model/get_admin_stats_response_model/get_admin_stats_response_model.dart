import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_admin_stats_response_model.g.dart';

@JsonSerializable()
class GetAdminStatsResponseModel {
  bool? status;
  Data? data;
  String? message;

  GetAdminStatsResponseModel({this.status, this.data, this.message});

  factory GetAdminStatsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAdminStatsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAdminStatsResponseModelToJson(this);
}
