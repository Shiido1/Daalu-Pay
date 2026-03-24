import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_notifications_response_model.g.dart';

@JsonSerializable()
class GetAllNotificationsResponseModel {
  String? status;
  List<Datum>? data;

  GetAllNotificationsResponseModel({this.status, this.data});

  factory GetAllNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllNotificationsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllNotificationsResponseModelToJson(this);
  }
}
