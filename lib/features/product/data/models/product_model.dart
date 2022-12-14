

import 'package:tadawal/features/product/domain/entity/product.dart';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// ignore: must_be_immutable
class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required int price,
    required String category,
    required String image,
    this.discountPercentage ,
    this.rating,
    this.stock,
    this.brand,
    this.listOfImages,
  }) : super(id: id,
            tittle: title,
            price: price,
            description: description,
            category: category,
            image: image);

  // int id;
  // String title;
  // String description;
  // int price;
  // String category;
  // String image;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  List<String>? listOfImages;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"],
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        image: json["thumbnail"] ?? '',
        listOfImages: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": tittle,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": image,
        "images": List<dynamic>.from(listOfImages!.map((x) => x)),
      };
}
