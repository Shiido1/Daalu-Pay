class AddAccountEntityModel {
  String? accountNumber;
  String? bankName;
  String? accountName;

  AddAccountEntityModel({
    this.accountNumber,
    this.bankName,
    this.accountName,
  });

  factory AddAccountEntityModel.fromJson(Map<String, dynamic> json) {
    return AddAccountEntityModel(
      accountNumber: json['account_number']?.toString(),
      bankName: json['bank_name']?.toString(),
      accountName: json['account_name']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (accountNumber != null) 'account_number': accountNumber,
        if (bankName != null) 'bank_name': bankName,
        if (accountName != null) 'account_name': accountName,
      };
}
