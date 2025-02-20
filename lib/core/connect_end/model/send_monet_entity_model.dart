class SendMonetEntityModel {
  String? amount;
  String? recipientAddress;
  String? currency;
  String? documentType;
  String? description;
  String? recipientEmail;
  String? recipientName;

  SendMonetEntityModel(
      {this.amount,
      this.recipientAddress,
      this.currency,
      this.documentType,
      this.description,
      this.recipientEmail,
      this.recipientName});

  factory SendMonetEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMonetEntityModel(
      amount: json['amount']?.toString(),
      recipientAddress: json['recipient_address']?.toString(),
      currency: json['currency']?.toString(),
      documentType: json['document_type']?.toString(),
      recipientEmail: json['recipient_email']?.toString(),
      recipientName: json['recipient_name']?.toString(),
      description: json['description']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (recipientAddress != null) 'recipient_address': recipientAddress,
        if (recipientName != null) 'recipient_name': recipientAddress,
        if (recipientEmail != null) 'recipient_email': recipientAddress,
        if (description != null) 'description': recipientAddress,
        if (currency != null) 'currency': currency,
        if (documentType != null) 'document_type': documentType,
      };
}
