
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/exceptions.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/lang_local_datasource/lang_local_datasource.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/language_repositories.dart';

class LanguageRepositoryImp implements LanguageRepository{
  final LanguageLocalDataSource languageLocalDataSource;

  LanguageRepositoryImp({required this.languageLocalDataSource});


  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try{
      final langIsChanged = await languageLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try{
      final langCode = await languageLocalDataSource.getSavedLang();
      return Right(langCode.toString());
    }on CacheException{
      return Left(CacheFailure());
    }
  }

}