import 'dart:convert';

import 'price.dart';

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  Price? listPrice;
  Price? retailPrice;
  String? buyLink;

  SaleInfo(
      {this.country,
      this.saleability,
      this.isEbook,
      this.listPrice,
      this.retailPrice,
      this.buyLink});

  @override
  String toString() {
    return 'SaleInfo(country: $country, saleability: $saleability, isEbook: $isEbook, listPrice: $listPrice, retailPrice: $retailPrice, buyLink: $buyLink)';
  }

  factory SaleInfo.fromMap(Map<String, dynamic> data) => SaleInfo(
        country: data['country'] as String?,
        saleability: data['saleability'] as String?,
        isEbook: data['isEbook'] as bool?,
        listPrice:
            data['listPrice'] != null ? Price.fromMap(data['listPrice']) : null,
        retailPrice: data['retailPrice'] != null
            ? Price.fromMap(data['retailPrice'])
            : null,
        buyLink: data['buyLink'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
        'listPrice': listPrice?.toMap(),
        'retailPrice': retailPrice?.toMap(),
        'buyLink': buyLink,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SaleInfo].
  factory SaleInfo.fromJson(String data) {
    return SaleInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SaleInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
