class SwapEntiyModel {
  String? fromCurrency;
  String? toCurrency;
  String? amount;
  String? fromAmount;
  String? toAmount;
  String? rate;

  SwapEntiyModel({
    this.fromCurrency,
    this.toCurrency,
    this.amount,
    this.fromAmount,
    this.toAmount,
    this.rate,
  });

  factory SwapEntiyModel.fromJson(Map<String, dynamic> json) {
    return SwapEntiyModel(
      fromCurrency: json['from_currency']?.toString(),
      toCurrency: json['to_currency']?.toString(),
      amount: json['amount']?.toString(),
      fromAmount: json['from_amount']?.toString(),
      toAmount: json['to_amount']?.toString(),
      rate: json['rate']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        if (fromCurrency != null) 'from_currency': fromCurrency,
        if (toCurrency != null) 'to_currency': toCurrency,
        if (amount != null) 'amount': amount,
        if (fromAmount != null) 'from_amount': fromAmount,
        if (toAmount != null) 'to_amount': toAmount,
        if (rate != null) 'rate': rate,
      };
}
