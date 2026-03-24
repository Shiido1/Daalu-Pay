import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_message_response.g.dart';

@JsonSerializable()
class GetMessageResponse {
  bool? status;
  List<Datum>? data;
  String? message;

  GetMessageResponse({this.status, this.data, this.message});

  factory GetMessageResponse.fromJson(Map<String, dynamic> json) {
    return _$GetMessageResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetMessageResponseToJson(this);
}
