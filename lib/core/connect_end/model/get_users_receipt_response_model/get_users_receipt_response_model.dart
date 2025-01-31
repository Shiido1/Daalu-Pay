import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_users_receipt_response_model.g.dart';

@JsonSerializable()
class GetUsersReceiptResponseModel {
  String? status;
  List<Datum>? data;

  GetUsersReceiptResponseModel({this.status, this.data});

  factory GetUsersReceiptResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetUsersReceiptResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUsersReceiptResponseModelToJson(this);
}
