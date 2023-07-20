import 'user.dart';

class Product {
  final String title;
  final String? description;
  final String imageUrl;

  final User seller;

  final String? purchasePrice;
  final String? rentPrice;
  final bool isFree;
  final int? viewCount;

  const Product({
    required this.title,
    required this.imageUrl,
    this.description,
    this.purchasePrice,
    this.rentPrice,
    this.isFree = false,
    this.viewCount,
    required this.seller,
  });
}
