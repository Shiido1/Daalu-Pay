import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'notification_user_response_model.g.dart';

@JsonSerializable()
class NotificationUserResponseModel {
	String? status;
	Data? data;

	NotificationUserResponseModel({this.status, this.data});

	factory NotificationUserResponseModel.fromJson(Map<String, dynamic> json) {
		return _$NotificationUserResponseModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$NotificationUserResponseModelToJson(this);
}
