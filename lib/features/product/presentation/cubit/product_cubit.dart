import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/features/product/domain/usecases/add_product_usecase.dart';
import 'package:tadawal/features/product/domain/usecases/get_product_usecase.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(
      {required this.addProductUseCase, required this.getProductUseCase})
      : super(ProductInitialState());

  final GetProductUseCase getProductUseCase;
  final AddProductUseCase addProductUseCase;

  Future<void> getProductEntity() async {
    emit(ProductIsLoadingState());
    Either<Failure, Product> productEntity =
        await getProductUseCase(NoParams());
    emit(productEntity.fold(
        (failure) => ProductErrorState(msg: _mapFailureToMsg(failure)),
        (product) => ProductLoadedState(product: product)));
  }



  Future<void> addProductEntity() async {

    emit(ProductIsLoadingState());
    Either<Failure, Product> productEntity = await addProductUseCase(
        const Product(
            id: 0,
            tittle: 'tittle',
            price: 10,
            description: 'description',
            image: 'image',
            category: 'category'));
    emit(productEntity.fold(
        (failure) => ProductErrorState(msg: _mapFailureToMsg(failure)),
        (product) => AddProductState(product: product)));
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
