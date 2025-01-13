import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_admin_transactions_response_model.g.dart';

@JsonSerializable()
class GetAdminTransactionsResponseModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetAdminTransactionsResponseModel({this.status, this.data, this.message});

  factory GetAdminTransactionsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return _$GetAdminTransactionsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAdminTransactionsResponseModelToJson(this);
  }
}
