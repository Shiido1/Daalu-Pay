class SendMonetEntityModel {
  String? amount;
  String? recipientAddress;
  String? currency;
  String? documentType;
  String? description;
  String? recipientEmail;
  String? recipientName;
  String? qrCode;

  SendMonetEntityModel(
      {this.amount,
      this.recipientAddress,
      this.currency,
      this.documentType,
      this.description,
      this.recipientEmail,
      this.qrCode,
      this.recipientName});

  factory SendMonetEntityModel.fromJson(Map<String, dynamic> json) {
    return SendMonetEntityModel(
      amount: json['amount']?.toString(),
      recipientAddress: json['payment_details']?.toString(),
      currency: json['currency']?.toString(),
      documentType: json['document_type']?.toString(),
      recipientEmail: json['recipient_email']?.toString(),
      recipientName: json['recipient_name']?.toString(),
      description: json['description']?.toString(),
      qrCode: json['qr_code']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (recipientAddress != null) 'payment_details': recipientAddress,
        if (recipientName != null) 'recipient_name': recipientName,
        if (recipientEmail != null) 'recipient_email': recipientEmail,
        if (description != null) 'description': description,
        if (currency != null) 'currency': currency,
        if (documentType != null) 'document_type': documentType,
        if (qrCode != null) 'qr_code': qrCode,
      };
}
