import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

abstract class AddProductRepository {
  Future<Either<Failure,Product>> addProduct(Product product);
}
