
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';

abstract class ThemeRepository {
  Future<Either<Failure,bool>> changeTheme({required bool isDark});
  Future<Either<Failure,bool>> getSavedTheme();
}