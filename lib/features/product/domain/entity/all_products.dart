
import 'package:equatable/equatable.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

class AllProducts extends Equatable{

  final List<Product> products;
  final   int total;
  final int skip;
  final int limit;

 const AllProducts(this.products, this.total, this.skip, this.limit);

  @override
  List<Object?> get props => [products,total,skip,limit];

}