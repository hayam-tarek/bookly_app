class Price {
  double? amount;
  String? currencyCode;

  Price({this.amount, this.currencyCode});

  factory Price.fromMap(Map<String, dynamic> data) => Price(
        amount: (data['amount'] as num?)?.toDouble(),
        currencyCode: data['currencyCode'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'currencyCode': currencyCode,
      };
}
