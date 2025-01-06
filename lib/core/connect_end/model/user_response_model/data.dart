import 'package:json_annotation/json_annotation.dart';

import 'transaction.dart';
import 'wallet.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? status;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<Wallet>? wallets;
  List<Transaction>? transactions;

  Data({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.wallets,
    this.transactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
