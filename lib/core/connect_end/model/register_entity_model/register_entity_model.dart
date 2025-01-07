import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_entity_model.g.dart';

@JsonSerializable()
class RegisterEntityModel {
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  String? email;
  @JsonKey(name: 'phone_number')
  String? phoneNumber;
  String? gender;
  String? address;
  String? city;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;
  @JsonKey(name: 'zip_code')
  String? zipCode;
  String? country;
  String? password;
  @JsonKey(name: 'document_type')
  String? documentType;
  @JsonKey(name: 'document_file')
  MultipartFile? documentFile;
  @JsonKey(name: 'confirm_password')
  String? confirmPassword;

  RegisterEntityModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.city,
    this.dateOfBirth,
    this.zipCode,
    this.country,
    this.password,
    this.documentType,
    this.documentFile,
    this.confirmPassword,
  });

  factory RegisterEntityModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterEntityModelToJson(this);
}
