class ApproveWithdrawalEntityModel {
  String? proofOfPayment;
  String? reference;

  ApproveWithdrawalEntityModel({this.proofOfPayment, this.reference});

  factory ApproveWithdrawalEntityModel.fromJson(Map<String, dynamic> json) {
    return ApproveWithdrawalEntityModel(
      proofOfPayment: json['proof_of_payment']?.toString(),
      reference: json['reference']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (proofOfPayment != null) 'proof_of_payment': proofOfPayment,
        if (reference != null) 'reference': reference,
      };
}
