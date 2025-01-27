import 'package:dio/dio.dart';

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
    return KycEntityModel(
      documentType: json['documentType']?.toString(),
      documentFile: json['documentFile'],
      documentNumber: json['documentNumber']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (documentType != null) 'documentType': documentType,
        if (documentFile != null) 'lastName': documentFile,
        if (documentNumber != null) 'email': documentNumber,
      };
}
