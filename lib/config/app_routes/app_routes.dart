import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';
import 'package:tadawal/features/product/presentation/product_screen/add_product_screen.dart';
import 'package:tadawal/features/product/presentation/product_screen/home_screen.dart';
import 'package:tadawal/features/product/presentation/product_screen/product_screen.dart';
import 'package:tadawal/injection_container.dart' as di;


class Routes {
  static const String initialRoute = '/';
  static const String homeRoute = '/homeScreen';
  static const String productRoute = '/productScreen';
  static const String addProductRoute = '/addProductScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create : (context) => di.sl<ProductCubit>()..getAllProducts(),
            child:  const HomeScreen(),
          ),        );
      case Routes.productRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create : (context) => di.sl<ProductCubit>()
              ..getProductEntity(productId: routeSettings.arguments as int ),
            child:  ProductScreen(
              productId: routeSettings.arguments as int,
            ),
          ),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case Routes.addProductRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create : (context) => di.sl<ProductCubit>(),
            child:  const AddProductScreen(),
          ),
        );

      default:
        return null;
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(body: Text(AppStrings.noRouteFound)),
    );
  }
}
