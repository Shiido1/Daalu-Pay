import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'initiate_chat_response_model.g.dart';

@JsonSerializable()
class InitiateChatResponseModel {
  bool? status;
  Data? data;
  String? message;

  InitiateChatResponseModel({this.status, this.data, this.message});

  factory InitiateChatResponseModel.fromJson(Map<String, dynamic> json) {
    return _$InitiateChatResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InitiateChatResponseModelToJson(this);
}
