import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/widgets/error_widget.dart';
import 'package:tadawal/core/widgets/loader_widget.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:tadawal/features/product/presentation/widgets/product_content.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _getProductFun() => BlocProvider.of<ProductCubit>(context).getProductEntity();
  _addProductFun(data) => BlocProvider.of<ProductCubit>(context)
      .addProductEntity(addProductData: data);

  final Map<String, dynamic> addProductData = {
    "id": 2,
    "title": "magdy",
    "description":
        "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
    "price": 899,
    "discountPercentage": 17.94,
    "rating": 4.44,
    "stock": 34,
    "brand": "Apple",
    "category": "smartphones",
    "thumbnail": null,
    "images": [
      "https://i.dummyjson.com/data/products/2/1.jpg",
      "https://i.dummyjson.com/data/products/2/2.jpg",
      "https://i.dummyjson.com/data/products/2/3.jpg",
      "https://i.dummyjson.com/data/products/2/thumbnail.jpg"
    ]
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductCubit, ProductStates>(builder: (context, state) {
          if (state is ProductIsLoadingState) {
            return loadingWidget();
          } else if (state is ProductErrorState) {
            return errorWidget(context,
                onPressFun: _getProductFun, msg: state.msg);
          } else if (state is ProductLoadedState) {
            return productContent(context, product: state.product);
          } else {
            return const Center(child: Text('un expected state'));
          }
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _addProductFun(addProductData),
          child: const Icon(Icons.refresh,color: Colors.black),
        ),
      ),
    );
  }
}
