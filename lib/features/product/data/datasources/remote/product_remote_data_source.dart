import 'package:tadawal/features/product/data/models/all_products_model.dart';
import 'package:tadawal/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getRemoteProductData({required int productId});
  Future<AllProductsModel> getRemoteAllProductData();
  Future<ProductModel> addRemoteProductData({required product});
}
