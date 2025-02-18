class ApproveReceiptEntityModel {
  String? amount;
  String? recipientAddress;
  String? currency;
  String? documentType;
  String? status;
  String? proofOfPayment;
  String? createdAt;
  String? updatedAt;

  ApproveReceiptEntityModel({
    this.amount,
    this.recipientAddress,
    this.currency,
    this.documentType,
    this.status,
    this.proofOfPayment,
    this.createdAt,
    this.updatedAt,
  });

  factory ApproveReceiptEntityModel.fromJson(Map<String, dynamic> json) {
    return ApproveReceiptEntityModel(
      amount: json['amount']?.toString(),
      recipientAddress: json['recipient_address']?.toString(),
      currency: json['currency']?.toString(),
      documentType: json['document_type']?.toString(),
      status: json['status']?.toString(),
      proofOfPayment: json['proof_of_payment']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (recipientAddress != null) 'recipient_address': recipientAddress,
        if (currency != null) 'currency': currency,
        if (documentType != null) 'document_type': documentType,
        if (status != null) 'status': status,
        if (proofOfPayment != null) 'proof_of_payment': proofOfPayment,
        if (createdAt != null) 'created_at': createdAt,
        if (updatedAt != null) 'updated_at': updatedAt,
      };
}
