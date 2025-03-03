import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'all_exchange_rates_response_model.g.dart';

@JsonSerializable()
class AllExchangeRatesResponseModel {
  bool? status;
  List<Datum>? data;
  String? message;

  AllExchangeRatesResponseModel({this.status, this.data, this.message});

  factory AllExchangeRatesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AllExchangeRatesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllExchangeRatesResponseModelToJson(this);
}
