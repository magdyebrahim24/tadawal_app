
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/theme_local_datasource/theme_local_datasource.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/theme_repository.dart';

class ThemeRepositoryImp implements ThemeRepository{
  final ThemeLocalDataSource themeLocalDataSource;

  ThemeRepositoryImp({required this.themeLocalDataSource});


  @override
  Future<Either<Failure, bool>> changeTheme({required bool isDark}) async {
    try{
    final isThemeChange = await themeLocalDataSource.changeTheme(isDark: isDark);
    return Right(isThemeChange);
    }on CacheFailure{
      return left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getSavedTheme() async {
    try{
      final savedTheme = await themeLocalDataSource.getSavedTheme();
      return Right(savedTheme ?? false);
    }on CacheFailure{
      return left(CacheFailure());
    }
  }

}