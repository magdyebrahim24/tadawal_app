import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';

class GetProductUseCase implements UseCase<Product, NoParams> {
  final ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});
  @override
  Future<Either<Failure, Product>> call(NoParams params) =>
      productRepository.getProduct();
}

// if there is params like login page
/*
class LogIn extends Equatable{
  final String name ;
  final String password;

  const LogIn(this.name, this.password);
  @override
  List<Object?> get props => [name , password];

}


 */
