
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';

abstract class LanguageRepository {
  Future<Either<Failure, bool>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}