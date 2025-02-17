class SendMonetEntityModel {
  String? amount;
  String? recipientAddress;
  String? currency;
  String? documentType;

  SendMonetEntityModel(
      {this.amount, this.recipientAddress, this.currency, this.documentType});

  factory SendMonetEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMonetEntityModel(
      amount: json['amount']?.toString(),
      recipientAddress: json['recipient_address']?.toString(),
      currency: json['currency']?.toString(),
      documentType: json['document_type']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (recipientAddress != null) 'recipient_address': recipientAddress,
        if (currency != null) 'currency': currency,
        if (documentType != null) 'document_type': documentType,
      };
}
