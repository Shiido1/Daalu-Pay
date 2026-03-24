class WithdrawalEntityModel {
  String? amount;
  String? bankAccountId;

  WithdrawalEntityModel({this.amount, this.bankAccountId});

  factory WithdrawalEntityModel.fromJson(Map<String, dynamic> json) {
    return WithdrawalEntityModel(
      amount: json['amount']?.toString(),
      bankAccountId: json['bank_account_id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (bankAccountId != null) 'bank_account_id': bankAccountId,
      };
}
