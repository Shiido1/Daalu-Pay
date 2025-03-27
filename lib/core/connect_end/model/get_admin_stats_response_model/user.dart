import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? photo;
  String? gender;
  String? email;
  String? phone;
  String? status;
  String? kycStatus;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? fullName;

  User({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.photo,
    this.gender,
    this.email,
    this.phone,
    this.status,
    this.kycStatus,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
