import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/exceptions.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/network/network_info.dart';
import 'package:tadawal/features/product/data/datasources/local/product_local_data_source.dart';
import 'package:tadawal/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';

class ProductRepositoriesImpl implements ProductRepository {
  final NetworkInfo networkInfo;
  final ProductLocalDataSource localProductDataSource;
  final ProductRemoteDataSource remoteProductDataSource;

  ProductRepositoriesImpl(
      {required this.networkInfo,
    required this.localProductDataSource,
    required this.remoteProductDataSource});

  @override
  Future<Either<Failure, Product>> getProduct() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductData =
        await remoteProductDataSource.getRemoteProductData();
        localProductDataSource.cacheProduct(remoteProductData);
        return Right(remoteProductData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProductData =
        await localProductDataSource.getCachedProductData();
        return Right(localProductData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> addProduct() async{
    try {
    // final  ProductModel productModel ;
      final remoteProductData =
          await remoteProductDataSource.addRemoteProductData();
      localProductDataSource.cacheProduct(remoteProductData);
      return Right(remoteProductData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}




//
//   getRemoteProductDataAndCacheItAndHandelServerException() async{
//     try {
//       final remoteProductData =
//           await remoteProductDataSource.getRemoteProductData();
//       localProductDataSource.cacheProduct(remoteProductData);
//       return Right(remoteProductData);
//     } on ServerExceptions {
//       return Left(ServerFailure());
//     }
//   }
//
//   getCachedProductDataItAndHandelCacheException() async{
//     try {
//       final localProductData =
//       await localProductDataSource.getCachedProductData();
//       return Right(localProductData);
//     } on CacheExceptions {
//       return Left(CacheFailure());
//     }
//   }
