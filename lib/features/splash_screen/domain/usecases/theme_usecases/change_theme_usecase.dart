
import 'package:dartz/dartz.dart';
import 'package:tadawal/core/error/failures.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/features/splash_screen/domain/repositories/theme_repository.dart';

class ChangeThemeUseCase implements UseCase<bool,bool>{
  final ThemeRepository themeRepository;

  ChangeThemeUseCase({required this.themeRepository});
  @override
  Future<Either<Failure, bool>> call(bool isDark) async {
    return await themeRepository.changeTheme(isDark: isDark);
  }

}