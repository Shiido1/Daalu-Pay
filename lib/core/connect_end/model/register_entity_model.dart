import 'package:dio/dio.dart';

class RegisterEntityModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? gender;
  String? address;
  String? city;
  String? dateOfBirth;
  String? zipCode;
  String? country;
  String? password;
  String? documentType;
  MultipartFile? documentFile;
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
    return RegisterEntityModel(
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      email: json['email']?.toString(),
      phoneNumber: json['phone_number']?.toString(),
      gender: json['gender']?.toString(),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      dateOfBirth: json['date_of_birth']?.toString(),
      zipCode: json['zip_code']?.toString(),
      country: json['country']?.toString(),
      password: json['password']?.toString(),
      documentType: json['document_type']?.toString(),
      documentFile: json['document_file'],
      confirmPassword: json['confirm_password']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phone_number': phoneNumber,
        if (gender != null) 'gender': gender,
        if (address != null) 'address': address,
        if (city != null) 'city': city,
        if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
        if (zipCode != null) 'zip_code': zipCode,
        if (country != null) 'country': country,
        if (password != null) 'password': password,
        if (documentType != null) 'document_type': documentType,
        if (documentFile != null) 'document_file': documentFile,
        if (confirmPassword != null) 'confirm_password': confirmPassword,
      };
}
