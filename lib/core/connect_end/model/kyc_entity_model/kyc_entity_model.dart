import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kyc_entity_model.g.dart';

@JsonSerializable()
class KycEntityModel {
  String? documentType;
  MultipartFile? documentFile;
  String? documentNumber;

  KycEntityModel({
    this.documentType,
    this.documentFile,
    this.documentNumber,
  });

  factory KycEntityModel.fromJson(Map<String, dynamic> json) {
    return _$KycEntityModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KycEntityModelToJson(this);
}
