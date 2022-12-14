
import 'package:flutter/cupertino.dart';
import 'package:tadawal/core/api/api_consumer.dart';
import 'package:tadawal/core/api/end_point.dart';
import 'package:tadawal/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:tadawal/features/product/data/models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  ApiConsumer apiConsumer;
  ProductRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ProductModel> getRemoteProductData() async{
    final response = await apiConsumer.get(path: EndPoints.getOneProductUrl);
    return ProductModel.fromJson(response);
  }



  @override
  Future<ProductModel> addRemoteProductData({required product}) async{


    Map<String,dynamic> productData = {
      "id": product.id,
      "title": product.tittle,
      "description": product.description,
      "price": product.price,
      "discountPercentage": 17.94,
      "rating": 4.44,
      "stock": 34,
      "brand": "Apple",
      "category": product.category,
      "thumbnail": product.image,
      "images": [
        "https://i.dummyjson.com/data/products/2/1.jpg",
        "https://i.dummyjson.com/data/products/2/2.jpg",
        "https://i.dummyjson.com/data/products/2/3.jpg",
        "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
      ]
    };


    debugPrint(product.toString());


    final response = await apiConsumer.post(path: EndPoints.addProductUrl,
    body: productData);

    // Map<String, dynamic> productModelToJson(ProductModel data) => data.toJson();

    return ProductModel.fromJson(response);
    }

}