import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_a_notification_message_model.g.dart';

@JsonSerializable()
class GetANotificationMessageModel {
  String? status;
  Datum? datum;

  GetANotificationMessageModel({this.status, this.datum});

  factory GetANotificationMessageModel.fromJson(Map<String, dynamic> json) {
    return _$GetANotificationMessageModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetANotificationMessageModelToJson(this);
}
