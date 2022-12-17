import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/language_repositories.dart';

class GetLanguageUseCase implements UseCase<String, NoParams> {
  final LanguageRepository languageRepository;

  GetLanguageUseCase({required this.languageRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await languageRepository.getSavedLang();
  }
}
