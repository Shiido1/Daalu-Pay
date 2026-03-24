import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_exchange_rate_response_model.g.dart';

@JsonSerializable()
class GetExchangeRateResponseModel {
  bool? status;
  Data? data;
  String? message;

  GetExchangeRateResponseModel({this.status, this.data, this.message});

  factory GetExchangeRateResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetExchangeRateResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetExchangeRateResponseModelToJson(this);
}
