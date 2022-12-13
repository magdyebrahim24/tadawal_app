
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:tadawal/core/api/api_consumer.dart';
import 'package:tadawal/core/api/end_point.dart';
import 'package:tadawal/core/error/exceptions.dart';
import 'package:tadawal/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:tadawal/features/product/data/models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource{
  ApiConsumer apiConsumer;
  ProductRemoteDataSourceImpl({required this.apiConsumer});

  final dio = Dio();
  @override
  Future<ProductModel> getRemoteProductData() async{
    final response = await apiConsumer.get(path: EndPoints.getOneProductUrl);
    return ProductModel.fromJson(response);
  }



  @override
  Future<ProductModel> addRemoteProductData() async{
    debugPrint('enter dio method-----------------------');

    Map<String,dynamic> productData = {
      "id": 2,
      "title": "magdy",
      "description": "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
      "price": 899,
      "discountPercentage": 17.94,
      "rating": 4.44,
      "stock": 34,
      "brand": "Apple",
      "category": "smartphones",
      "thumbnail": null,
      "images": [
        "https://i.dummyjson.com/data/products/2/1.jpg",
        "https://i.dummyjson.com/data/products/2/2.jpg",
        "https://i.dummyjson.com/data/products/2/3.jpg",
        "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
      ]
    };

    // Map<String, dynamic> productModelToJson(ProductModel data) => data.toJson();
    String productUrl = '${EndPoints.baseUrl}/add';
    // debugPrint(productModelToJson.call['id']);
    final response = await dio.post(productUrl,data: productData);
    if (response.statusCode == 200 ){
      // debugPrint('Success-----------------------');
      debugPrint(response.data.toString());
      if (response.statusCode == 200 ){
        return ProductModel.fromJson(response.data);
      }else{
        throw const ServerException();
      }
    }else{
      throw const ServerException();
    }  }

}