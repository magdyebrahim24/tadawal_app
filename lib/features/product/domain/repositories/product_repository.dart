import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProduct();

  Future<Either<Failure, Product>> addProduct({required Product product});
}
