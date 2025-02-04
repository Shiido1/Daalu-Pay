class NotificationUserEntityModel {
	String? token;
	String? deviceType;

	NotificationUserEntityModel({this.token, this.deviceType});

	factory NotificationUserEntityModel.fromJson(Map<String, dynamic> json) {
		return NotificationUserEntityModel(
			token: json['token'] as String?,
			deviceType: json['device_type'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'token': token,
				'device_type': deviceType,
			};
}
