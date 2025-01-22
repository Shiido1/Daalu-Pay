import 'package:dio/dio.dart';

class AliPayEntityModel {
  String? amount;
  MultipartFile? receipt;

  AliPayEntityModel({this.amount, this.receipt});

  factory AliPayEntityModel.fromJson(Map<String, dynamic> json) {
    return AliPayEntityModel(
      amount: json['amount']?.toString(),
      receipt: json['proof'],
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (receipt != null) 'proof': receipt,
      };
}
