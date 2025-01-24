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
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      email: json['email']?.toString(),
      phoneNumber: json['phoneNumber']?.toString(),
      gender: json['gender']?.toString(),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      dateOfBirth: json['dateOfBirth']?.toString(),
      zipCode: json['zipCode']?.toString(),
      country: json['country']?.toString(),
      password: json['password']?.toString(),
      documentType: json['documentType']?.toString(),
      documentFile: json['documentFile'],
      confirmPassword: json['confirmPassword']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (firstName != null) 'firstName': firstName,
        if (lastName != null) 'lastName': lastName,
        if (email != null) 'email': email,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (gender != null) 'gender': gender,
        if (address != null) 'address': address,
        if (city != null) 'city': city,
        if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
        if (zipCode != null) 'zipCode': zipCode,
        if (country != null) 'country': country,
        if (password != null) 'password': password,
        if (documentType != null) 'documentType': documentType,
        if (documentFile != null) 'documentFile': documentFile,
        if (confirmPassword != null) 'confirmPassword': confirmPassword,
      };
}
