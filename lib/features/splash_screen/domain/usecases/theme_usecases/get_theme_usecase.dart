
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/theme_repository.dart';

class GetThemeUseCase implements UseCase<bool,NoParams>{

  final ThemeRepository themeRepository;

  GetThemeUseCase({required this.themeRepository});
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await themeRepository.getSavedTheme();
  }

}