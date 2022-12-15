
import 'package:tadawal/features/product/data/models/product_model.dart';
import 'package:tadawal/features/product/domain/entity/all_products.dart';

// AllProductModel allProductModelFromJson(String str) => AllProductModel.fromJson(json.decode(str));
// String allProductModelToJson(AllProductModel data) => json.encode(data.toJson());

// ignore: must_be_immutable
class AllProductsModel extends AllProducts{

  const AllProductsModel({
    required List<ProductModel> products,
    required int total,
    required int skip,
    required int limit,
  }) : super(products,total,skip,limit);



  factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
    products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<ProductModel>.from(products),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

// class Product {
//   Product({
//     this.id,
//     this.title,
//     this.description,
//     this.price,
//     this.discountPercentage,
//     this.rating,
//     this.stock,
//     this.brand,
//     this.category,
//     this.thumbnail,
//     this.images,
//   });
//
//   int id;
//   String title;
//   String description;
//   int price;
//   double discountPercentage;
//   double rating;
//   int stock;
//   String brand;
//   String category;
//   String thumbnail;
//   List<String> images;
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     title: json["title"],
//     description: json["description"],
//     price: json["price"],
//     discountPercentage: json["discountPercentage"].toDouble(),
//     rating: json["rating"].toDouble(),
//     stock: json["stock"],
//     brand: json["brand"],
//     category: json["category"],
//     thumbnail: json["thumbnail"],
//     images: List<String>.from(json["images"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "description": description,
//     "price": price,
//     "discountPercentage": discountPercentage,
//     "rating": rating,
//     "stock": stock,
//     "brand": brand,
//     "category": category,
//     "thumbnail": thumbnail,
//     "images": List<dynamic>.from(images.map((x) => x)),
//   };
// }
