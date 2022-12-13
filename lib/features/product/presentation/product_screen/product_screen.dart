import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // _getProductData() =>
  //     BlocProvider.of<ProductCubit>(context).getProductEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocBuilder<ProductCubit, ProductStates>(builder: (context, state) {
        if (state is ProductIsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductErrorState) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: Text('error')),
              FloatingActionButton(
                onPressed: () =>
                    BlocProvider.of<ProductCubit>(context).getProductEntity(),
                child: const Icon(Icons.ac_unit_sharp),
              ),
            ],
          );
        } else if (state is ProductLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.product.tittle,
                  style: Theme.of(context).textTheme.headline6),
              Text(state.product.description,
                  style: Theme.of(context).textTheme.bodyText1),
              Text('${state.product.price.toString()}\$'),
            ],
          );
        } else {
          return const Center(child: Text('un expected state'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ProductCubit>().getProductEntity(),
        child: const Icon(Icons.ac_unit_sharp),
      ),
    );
  }
}
