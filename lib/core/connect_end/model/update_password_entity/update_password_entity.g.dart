// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordEntity _$UpdatePasswordEntityFromJson(
        Map<String, dynamic> json) =>
    UpdatePasswordEntity(
      oldPassword: json['old_password'] as String?,
      newPassword: json['new_password'] as String?,
    );

Map<String, dynamic> _$UpdatePasswordEntityToJson(
        UpdatePasswordEntity instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
    };
