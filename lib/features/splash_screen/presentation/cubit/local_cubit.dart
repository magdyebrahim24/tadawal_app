import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/core/usecases/usecase.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/lang_usecases/change_lang_usecase.dart';
import 'package:tadawal/features/splash_screen/domain/usecases/lang_usecases/get_lang_usecase.dart';
import 'package:tadawal/features/splash_screen/presentation/cubit/local_states.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(
      {required this.getLanguageUseCase, required this.changeLanguageUseCase})
      : super(const ChangeLocaleState(
            selectedLocale: Locale(AppStrings.englishCode)));

  final GetLanguageUseCase getLanguageUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLanguage() async {
    final response = await getLanguageUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheError), (value) {
      currentLangCode = value;
      emit(ChangeLocaleState(selectedLocale: Locale(currentLangCode)));
    });
  }

  Future<void> _changeLanguage({required String langCode}) async {
    final response = await changeLanguageUseCase(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheError), (value) {
      currentLangCode = langCode;
      emit(ChangeLocaleState(selectedLocale: Locale(langCode)));
    });
  }

  void toEnglish() => _changeLanguage(langCode: AppStrings.englishCode);
  void toArabic() => _changeLanguage(langCode: AppStrings.arabicCode);
}
