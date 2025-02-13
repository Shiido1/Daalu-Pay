class KycEntityModel {
  String? documentType;
  String? documentFile;
  String? documentNumber;

  KycEntityModel({
    this.documentType,
    this.documentFile,
    this.documentNumber,
  });

  factory KycEntityModel.fromJson(Map<String, dynamic> json) {
    return KycEntityModel(
      documentType: json['documentType']?.toString(),
      documentFile: json['documentFile']?.toString(),
      documentNumber: json['documentNumber']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (documentType != null) 'documentType': documentType,
        if (documentFile != null) 'documentFile': documentFile,
        if (documentNumber != null) 'documentNumber': documentNumber,
      };
}
