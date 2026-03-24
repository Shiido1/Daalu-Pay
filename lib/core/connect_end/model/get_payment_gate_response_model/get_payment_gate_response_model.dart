import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_payment_gate_response_model.g.dart';

@JsonSerializable()
class GetPaymentGateResponseModel {
  bool? status;
  List<Datum>? data;
  String? message;

  GetPaymentGateResponseModel({this.status, this.data, this.message});

  factory GetPaymentGateResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetPaymentGateResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPaymentGateResponseModelToJson(this);
}
