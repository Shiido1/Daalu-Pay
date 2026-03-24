import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_transaction_response_model.g.dart';

@JsonSerializable()
class GetTransactionResponseModel {
  String? status;
  List<Datum>? data;

  GetTransactionResponseModel({this.status, this.data});

  factory GetTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetTransactionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTransactionResponseModelToJson(this);
}
