import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tadawal/core/api/api_consumer.dart';
import 'package:tadawal/core/api/app_interceptor.dart';
import 'package:tadawal/core/api/dio_consumer.dart';
import 'package:tadawal/core/network/network_info.dart';
import 'package:tadawal/features/product/data/datasources/local/product_local_data_source.dart';
import 'package:tadawal/features/product/data/datasources/local/product_local_data_source_impl.dart';
import 'package:tadawal/features/product/data/datasources/remote/product_remote_data_source.dart';
import 'package:tadawal/features/product/data/datasources/remote/product_remote_data_source_impl.dart';
import 'package:tadawal/features/product/data/repositories/product_repository_impl.dart';
import 'package:tadawal/features/product/domain/repositories/product_repository.dart';
import 'package:tadawal/features/product/domain/usecases/add_product_usecase.dart';
import 'package:tadawal/features/product/domain/usecases/get_all_products_uscase.dart';
import 'package:tadawal/features/product/domain/usecases/get_product_usecase.dart';
import 'package:tadawal/features/product/presentation/cubit/product_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<ProductCubit>(
      () => ProductCubit(getAllProductsUseCase: sl(),addProductUseCase: sl(), getProductUseCase: sl()));
  // sl.registerFactory<LocaleCubit>(
  //         () => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetProductUseCase>(
      () => GetProductUseCase(productRepository: sl()));
  sl.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(productRepository: sl()));
  sl.registerLazySingleton<GetAllProductsUseCase>(
          () => GetAllProductsUseCase(productRepository: sl()));

  // sl.registerLazySingleton<ChangeLangUseCase>(
  //         () => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoriesImpl(
      networkInfo: sl(),
      localProductDataSource: sl(),
      remoteProductDataSource: sl()));

  // sl.registerLazySingleton<LangRepository>(
  //         () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));


  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));

  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => Dio());
}
