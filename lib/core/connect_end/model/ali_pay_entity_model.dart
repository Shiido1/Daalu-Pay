import 'package:dio/dio.dart';

class AliPayEntityModel {
  String? amount;
  String? walletId;
  String? currency;
  MultipartFile? receipt;

  AliPayEntityModel({this.amount, this.receipt, this.walletId, this.currency});

  factory AliPayEntityModel.fromJson(Map<String, dynamic> json) {
    return AliPayEntityModel(
      amount: json['amount']?.toString(),
      walletId: json['wallet_id']?.toString(),
      currency: json['currency']?.toString(),
      receipt: json['proof'],
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (walletId != null) 'wallet_id': walletId,
        if (currency != null) 'currency': currency,
        if (receipt != null) 'proof': receipt,
      };
}
