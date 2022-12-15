import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/widgets/error_widget.dart';
import 'package:tadawal/core/widgets/loader_widget.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:tadawal/features/product/presentation/widgets/product_content.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.productId}) : super(key: key);
  final  int productId;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _getProductFun() => BlocProvider.of<ProductCubit>(context).getProductEntity(productId: widget.productId);
  // _addProductFun(data) => BlocProvider.of<ProductCubit>(context)
  //     .addProductEntity(addProductData: data);

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
        }
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   onPressed: () {},
        //   child: const Icon(Icons.refresh,color: Colors.black),
        // ),
      ),
    );
  }
}
