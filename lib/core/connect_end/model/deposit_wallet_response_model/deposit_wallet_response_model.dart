import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'deposit_wallet_response_model.g.dart';

@JsonSerializable()
class DepositWalletResponseModel {
  String? status;
  Data? data;

  DepositWalletResponseModel({this.status, this.data});

  factory DepositWalletResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DepositWalletResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DepositWalletResponseModelToJson(this);
}
