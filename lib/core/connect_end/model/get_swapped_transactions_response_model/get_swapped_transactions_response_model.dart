import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_swapped_transactions_response_model.g.dart';

@JsonSerializable()
class GetSwappedTransactionsResponseModel {
  String? status;
  List<Datum>? data;

  GetSwappedTransactionsResponseModel({this.status, this.data});

  factory GetSwappedTransactionsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return _$GetSwappedTransactionsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSwappedTransactionsResponseModelToJson(this);
  }
}
