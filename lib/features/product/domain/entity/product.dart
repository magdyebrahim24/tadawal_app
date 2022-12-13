import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String tittle;
  final int price;
  final String description;
  final String image;
  final String category;

  const Product(
      {required this.id,
      required this.tittle,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  @override
  List<Object?> get props => [id, tittle, price, description, image, category];
}

/*

 {
      "id": 1,
      "title": "iPhone 9",
      "description": "An apple mobile which is nothing like apple",
      "price": 549,
      "discountPercentage": 12.96,
      "rating": 4.69,
      "stock": 94,
      "brand": "Apple",
      "category": "smartphones",
      "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
      "images": [
        "https://i.dummyjson.com/data/products/1/1.jpg",
        "https://i.dummyjson.com/data/products/1/2.jpg",
        "https://i.dummyjson.com/data/products/1/3.jpg",
        "https://i.dummyjson.com/data/products/1/4.jpg",
        "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
      ]
    },
 */
