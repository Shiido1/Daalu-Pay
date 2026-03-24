import 'package:json_annotation/json_annotation.dart';

import 'swap.dart';
import 'transaction.dart';
import 'wallet.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  List<Wallet>? wallets;
  List<Transaction>? transactions;
  List<Swap>? swaps;

  Data({this.wallets, this.transactions, this.swaps});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
