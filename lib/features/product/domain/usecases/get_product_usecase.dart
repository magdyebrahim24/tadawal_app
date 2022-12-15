import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';

class GetProductUseCase implements UseCase<Product, int> {
  final ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});
  @override
  Future<Either<Failure, Product>> call(int productId) =>
      productRepository.getProduct(productId: productId);
}

