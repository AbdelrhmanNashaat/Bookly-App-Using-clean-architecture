class PriceInfo {
  final double? amount;
  final String? currencyCode;

  PriceInfo({this.amount, this.currencyCode});

  factory PriceInfo.fromJson(Map<String, dynamic> json) {
    return PriceInfo(
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount, 'currencyCode': currencyCode};
  }
}
