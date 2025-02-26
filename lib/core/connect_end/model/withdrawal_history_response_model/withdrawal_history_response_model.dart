import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'withdrawal_history_response_model.g.dart';

@JsonSerializable()
class WithdrawalHistoryResponseModel {
  String? status;
  List<Datum>? data;

  WithdrawalHistoryResponseModel({this.status, this.data});

  factory WithdrawalHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    return _$WithdrawalHistoryResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WithdrawalHistoryResponseModelToJson(this);
  }
}
