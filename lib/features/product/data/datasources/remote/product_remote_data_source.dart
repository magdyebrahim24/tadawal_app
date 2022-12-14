import 'package:tadawal/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getRemoteProductData();
  Future<ProductModel> addRemoteProductData({required product});
}
