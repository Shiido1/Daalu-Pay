class AliPayEntityModel {
  String? amount;
  String? walletId;
  String? receipt;

  AliPayEntityModel({
    this.amount,
    this.receipt,
    this.walletId,
  });

  factory AliPayEntityModel.fromJson(Map<String, dynamic> json) {
    return AliPayEntityModel(
      amount: json['amount']?.toString(),
      walletId: json['wallet_id']?.toString(),
      receipt: json['proof']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (walletId != null) 'wallet_id': walletId,
        if (receipt != null) 'proof': receipt,
      };
}
