import 'package:tadawal/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getCachedProductData();
  Future<void> cacheProduct(ProductModel productModel);
}
