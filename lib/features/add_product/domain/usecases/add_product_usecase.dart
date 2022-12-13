// import 'package:dartz/dartz.dart';
// import 'package:tadawal/core/error/failures.dart';
// import 'package:tadawal/core/usecases/usecase.dart';
// import 'package:tadawal/features/add_product/domain/repositories/add_product_repository.dart';
// import 'package:tadawal/features/product/domain/entity/product.dart';
//
// class AddProductUseCase implements UseCase<Failure, Product> {
//   final AddProductRepository addProductRepository;
//
//   AddProductUseCase(this.addProductRepository);
//   @override
//   Future<Either<Failure, Product>> call(Product params) => addProductRepository.addProduct(params);
// }
//
// // class AddProduct extends Equatable {
// //   final int id;
// //   final String tittle;
// //   final int price;
// //   final String description;
// //   final String image;
// //   final String category;
// //
// //  const AddProduct(
// //       {required this.id,
// //       required this.tittle,
// //       required this.price,
// //       required this.description,
// //       required this.image,
// //       required this.category});
// //   @override
// //   List<Object?> get props => [id,tittle,price,description,image,category];
// // }
