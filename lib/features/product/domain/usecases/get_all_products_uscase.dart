import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/product/domain/entity/all_products.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';

class GetAllProductsUseCase implements UseCase<AllProducts, NoParams> {
  final ProductRepository productRepository;

  GetAllProductsUseCase({required this.productRepository});

  @override
  Future<Either<Failure, AllProducts>> call(NoParams params) {
    return productRepository.getAllProducts();
  }
}
