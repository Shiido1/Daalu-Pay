// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterEntityModel _$RegisterEntityModelFromJson(Map<String, dynamic> json) =>
    RegisterEntityModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      zipCode: json['zip_code'] as String?,
      country: json['country'] as String?,
      password: json['password'] as String?,
      documentType: json['document_type'] as String?,
      documentFile: json['document_file'],
      confirmPassword: json['confirm_password'] as String?,
    );

Map<String, dynamic> _$RegisterEntityModelToJson(
        RegisterEntityModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'gender': instance.gender,
      'address': instance.address,
      'city': instance.city,
      'date_of_birth': instance.dateOfBirth,
      'zip_code': instance.zipCode,
      'country': instance.country,
      'password': instance.password,
      'document_type': instance.documentType,
      'document_file': instance.documentFile,
      'confirm_password': instance.confirmPassword,
    };
