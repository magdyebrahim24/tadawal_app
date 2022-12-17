import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/config/app_routes/app_routes.dart';
import 'package:tadawal/core/widgets/error_widget.dart';
import 'package:tadawal/core/widgets/float_button.dart';
import 'package:tadawal/core/widgets/loader_widget.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/cubit/product_state.dart';
import 'package:tadawal/features/product/presentation/widgets/home_content.dart';
import 'package:tadawal/config/locale/app_localizations.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/local_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getProductFun() => BlocProvider.of<ProductCubit>(context).getAllProducts();

  _changeLanguageFun() {
    if (AppLocalizations.of(context)!.isEnLocale) {
      BlocProvider.of<LocaleCubit>(context).toArabic();
    } else {
      BlocProvider.of<LocaleCubit>(context).toEnglish();
    }
  }

  bool isDark = false;

  _changeThemeFun() {
    setState(() {
      if (isDark) {
        isDark = false;
      } else {
        isDark = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
        centerTitle: true,
        leading: floatButton(
            onPressFun: () {}, icon: Icons.drag_handle_rounded),
        actions: [
          IconButton(
              icon: const Icon(Icons.color_lens_outlined),
              onPressed: () => _changeThemeFun()),
          IconButton(
              icon: const Icon(Icons.language_rounded),
              onPressed: () => _changeLanguageFun()),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductStates>(
          builder: (context, state) {
            if (state is ProductIsLoadingState) {
              return loadingWidget();
            } else if (state is ProductErrorState) {
              return errorWidget(context,
                  onPressFun: _getProductFun, msg: state.msg);
            } else if (state is AllProductsLoadedState) {
              return HomeContent(
                productsList: state.allProducts.products,
              );
            } else {
              return const Center(child: Text('un expected state'));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, Routes.addProductRoute),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
