class SendMonetEntityModel {
  String? amount;
  String? recipientAddress;
  String? currency;

  SendMonetEntityModel({this.amount, this.recipientAddress, this.currency});

  factory SendMonetEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMonetEntityModel(
      amount: json['amount']?.toString(),
      recipientAddress: json['recipient_address']?.toString(),
      currency: json['currency']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (recipientAddress != null) 'recipient_address': recipientAddress,
        if (currency != null) 'currency': currency,
      };
}
