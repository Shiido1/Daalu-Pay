import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_all_withdrawals_response_model.g.dart';

@JsonSerializable()
class GetAllWithdrawalsResponseModel {
  String? status;
  List<Datum>? data;

  GetAllWithdrawalsResponseModel({this.status, this.data});

  factory GetAllWithdrawalsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllWithdrawalsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllWithdrawalsResponseModelToJson(this);
  }
}
