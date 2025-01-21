import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'kyc.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  String? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  String? status;
  String? kycStatus;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Address? address;
  Kyc? kyc;

  Datum({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.status,
    this.kycStatus,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.address,
    this.kyc,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
