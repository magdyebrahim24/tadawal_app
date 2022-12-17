
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/language_repositories.dart';

class ChangeLanguageUseCase implements UseCase<bool,String>{

  final LanguageRepository languageRepository;

  ChangeLanguageUseCase({required this.languageRepository});

  @override
  Future<Either<Failure,bool>> call(String langCode) async {
    return await languageRepository.changeLang(langCode: langCode);
  }
  
}