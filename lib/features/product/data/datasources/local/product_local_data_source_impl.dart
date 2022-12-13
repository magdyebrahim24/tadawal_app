import 'package:tadawal/features/product/data/datasources/local/product_local_data_source.dart';
import 'package:tadawal/features/product/data/models/product_model.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource{

  @override
  Future<void> cacheProduct(ProductModel productModel) async {}

  @override
  Future<ProductModel> getCachedProductData() {
    throw UnimplementedError();
  }

}