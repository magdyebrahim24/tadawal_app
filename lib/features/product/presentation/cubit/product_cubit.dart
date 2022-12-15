import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/core/utils/constants.dart';
import 'package:tadawal/features/product/domain/entity/all_products.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/usecases/add_product_usecase.dart';
import 'package:tadawal/features/product/domain/usecases/get_all_products_uscase.dart';
import 'package:tadawal/features/product/domain/usecases/get_product_usecase.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit({required this.getAllProductsUseCase,
      required this.addProductUseCase, required this.getProductUseCase})
      : super(ProductInitialState());

  final GetProductUseCase getProductUseCase;
  final GetAllProductsUseCase getAllProductsUseCase;
  final AddProductUseCase addProductUseCase;

  Future<void> getProductEntity({required int productId}) async {
    emit(ProductIsLoadingState());
    Either<Failure, Product> productEntity =
        await getProductUseCase(productId);
    emit(productEntity.fold(
        (failure) => ProductErrorState(msg: _mapFailureToMsg(failure)),
        (product) => ProductLoadedState(product: product)));
  }

  Future<void> getAllProducts() async {
    emit(ProductIsLoadingState());
    Either<Failure, AllProducts> allProducts =
    await getAllProductsUseCase(NoParams());
    emit(allProducts.fold(
            (failure) => ProductErrorState(msg: _mapFailureToMsg(failure)),
            (allProducts) => AllProductsLoadedState(allProducts: allProducts)));
    Constants.showToast(message: 'Products Loaded');
  }

  Future<void> addProductEntity(
      {required  addProductData}) async {
    emit(ProductIsLoadingState());
    // Product productObject = const Product(
    //     id: 2,
    //     tittle: 'magdy good',
    //     price: 1000,
    //     description: 'its fantastic',
    //     image: 'image',
    //     category: 'category');
    Either<Failure, Product> productEntity =
        await addProductUseCase(addProductData);

    emit(productEntity.fold(
        (failure) => ProductErrorState(msg: _mapFailureToMsg(failure)),
        (product) => ProductLoadedState(product: product)));
    Constants.showToast(message: 'Saved Success');
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverError;
      case CacheFailure:
        return AppStrings.cacheError;
      default:
        return AppStrings.unExpectedError;
    }
  }
}
