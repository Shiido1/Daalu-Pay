class KycEntityModel {
  String? documentType;
  String? documentFile;
  String? documentNumber;
  String? passportPhoto;

  KycEntityModel({
    this.documentType,
    this.documentFile,
    this.documentNumber,
    this.passportPhoto,
  });

  factory KycEntityModel.fromJson(Map<String, dynamic> json) {
    return KycEntityModel(
      documentType: json['documentType']?.toString(),
      documentFile: json['documentFile']?.toString(),
      documentNumber: json['documentNumber']?.toString(),
      passportPhoto: json['passportPhoto']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (documentType != null) 'documentType': documentType,
        if (documentFile != null) 'documentFile': documentFile,
        if (documentNumber != null) 'documentNumber': documentNumber,
        if (passportPhoto != null) 'passportPhoto': passportPhoto,
      };
}
