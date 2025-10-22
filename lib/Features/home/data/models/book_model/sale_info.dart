import '../price_info.dart';

class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final PriceInfo? listPrice;
  final PriceInfo? retailPrice;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      country: json['country'] as String?,
      saleability: json['saleability'] as String?,
      isEbook: json['isEbook'] as bool?,
      listPrice: json['listPrice'] != null
          ? PriceInfo.fromJson(json['listPrice'])
          : null,
      retailPrice: json['retailPrice'] != null
          ? PriceInfo.fromJson(json['retailPrice'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
      'listPrice': listPrice?.toJson(),
      'retailPrice': retailPrice?.toJson(),
    };
  }
}
