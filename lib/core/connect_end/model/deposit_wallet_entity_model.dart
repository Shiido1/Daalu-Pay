class DepositWalletEntityModel {
  String? amount;
  String? currency;
  String? channel;
  String? walletId;

  DepositWalletEntityModel({
    this.amount,
    this.currency,
    this.channel,
    this.walletId,
  });

  factory DepositWalletEntityModel.fromJson(Map<String, dynamic> json) {
    return DepositWalletEntityModel(
      amount: json['amount']?.toString(),
      currency: json['currency']?.toString(),
      channel: json['channel']?.toString(),
      walletId: json['wallet_id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (currency != null) 'currency': currency,
        if (channel != null) 'channel': channel,
        if (walletId != null) 'wallet_id': walletId,
      };
}
