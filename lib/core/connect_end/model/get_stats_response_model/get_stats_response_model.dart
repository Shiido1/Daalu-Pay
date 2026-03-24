import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_stats_response_model.g.dart';

@JsonSerializable()
class GetStatsResponseModel {
  String? status;
  Data? data;

  GetStatsResponseModel({this.status, this.data});

  factory GetStatsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetStatsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetStatsResponseModelToJson(this);
}
