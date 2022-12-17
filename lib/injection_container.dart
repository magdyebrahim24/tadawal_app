import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:tadawal/features/splash_screen/data/data_sources/lang_local_datasource/lang_local_datasource.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/lang_local_datasource/lang_local_datasource_imp.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/theme_local_datasource/theme_local_datasource.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/theme_local_datasource/theme_local_datasource_imp.dart';
import 'package:tadawal/features/splash_screen/data/repositories/lang_reprositories_imp.dart';
import 'package:tadawal/features/splash_screen/data/repositories/theme_repository.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/language_repositories.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/theme_repository.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/lang_usecases/change_lang_usecase.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/lang_usecases/get_lang_usecase.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/theme_usecases/change_theme_usecase.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/theme_usecases/get_theme_usecase.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/local_cubit.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/theme_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<ProductCubit>(() => ProductCubit(
      getAllProductsUseCase: sl(),
      addProductUseCase: sl(),
      getProductUseCase: sl()));

  sl.registerFactory<LocaleCubit>(() => LocaleCubit(
        getLanguageUseCase: sl(),
        changeLanguageUseCase: sl(),
      ));
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(
    changeThemeUseCase: sl(),
    getThemeUseCase: sl()
  ));

  // Use cases
  sl.registerLazySingleton<GetProductUseCase>(
      () => GetProductUseCase(productRepository: sl()));
  sl.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(productRepository: sl()));
  sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(productRepository: sl()));

  sl.registerLazySingleton<ChangeLanguageUseCase>(
      () => ChangeLanguageUseCase(languageRepository: sl()));
  sl.registerLazySingleton<GetLanguageUseCase>(
      () => GetLanguageUseCase(languageRepository: sl()));

  sl.registerLazySingleton<ChangeThemeUseCase>(
      () => ChangeThemeUseCase(themeRepository: sl()));
  sl.registerLazySingleton<GetThemeUseCase>(
      () => GetThemeUseCase(themeRepository: sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoriesImpl(
      networkInfo: sl(),
      localProductDataSource: sl(),
      remoteProductDataSource: sl()));

  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImp(themeLocalDataSource: sl()));

  sl.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImp(languageLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());

  sl.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImp(sharedPreferences: sl()));

  sl.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImp(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

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
