import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/theme_usecases/change_theme_usecase.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/theme_usecases/get_theme_usecase.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final ChangeThemeUseCase changeThemeUseCase;
  final GetThemeUseCase getThemeUseCase;
  ThemeCubit({required this.changeThemeUseCase, required this.getThemeUseCase})
      : super(const ChangeThemeState(isThemeDark: false));

  bool isDark = false;

  Future<void> getSavedTheme() async {
    final response = await getThemeUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheError),
        (value) => emit(ChangeThemeState(isThemeDark: isDark)));
  }

  Future<void> _changeTheme({required bool isDark}) async {
    final response = await changeThemeUseCase(isDark);
    response.fold((l) => debugPrint(AppStrings.cacheError),
        (value) => emit(ChangeThemeState(isThemeDark: isDark)));
  }

  darkTheme() => _changeTheme(isDark: true);
  lightTheme() => _changeTheme(isDark: false);
}
