import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';

class AddProductUseCase implements UseCase<Product, Product> {
  final ProductRepository productRepository;

  AddProductUseCase({required this.productRepository});
  @override
  Future<Either<Failure, Product>> call(Product product) =>
      productRepository.addProduct();
}
