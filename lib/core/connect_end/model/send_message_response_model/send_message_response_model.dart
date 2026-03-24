import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'send_message_response_model.g.dart';

@JsonSerializable()
class SendMessageResponseModel {
  bool? status;
  Data? data;
  String? message;

  SendMessageResponseModel({this.status, this.data, this.message});

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SendMessageResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendMessageResponseModelToJson(this);
}
