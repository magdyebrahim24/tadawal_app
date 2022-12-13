import 'package:equatable/equatable.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

abstract class ProductStates extends Equatable {
  const ProductStates();
  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductStates {}

class ProductIsLoadingState extends ProductStates {}

class ProductLoadedState extends ProductStates {
  final Product product;
  const ProductLoadedState({required this.product});

  @override
  List<Object?> get props => [product];
}

class ProductErrorState extends ProductStates {
  final String msg;
  const ProductErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class AddProductState extends ProductStates {
  Product product = const Product(
      id: 0,
      price: 10,
      description: 'deacsvcasvasv',
      category: 'categeteg',
      image: 'imagevcas',
      tittle: 'fjuebfekj');
  AddProductState({required this.product});
  @override
  List<Object?> get props => [product];
}