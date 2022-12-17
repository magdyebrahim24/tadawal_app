import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/lang_local_datasource/lang_local_datasource.dart';

class LanguageLocalDataSourceImp implements LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;

  LanguageLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.local, langCode);

  @override
  Future<String?> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.local)
          ? sharedPreferences.getString(AppStrings.local)
          : AppStrings.englishCode;
}
