
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/splash_screen/data/data_sources/theme_local_datasource/theme_local_datasource.dart';

class ThemeLocalDataSourceImp implements ThemeLocalDataSource{
  final SharedPreferences sharedPreferences;

  ThemeLocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<bool> changeTheme({required bool isDark}) async {
    return  await sharedPreferences.setBool(AppStrings.theme, isDark);
 }

  @override
  Future<bool?> getSavedTheme() async {
   return  sharedPreferences.containsKey(AppStrings.theme) ?
   sharedPreferences.getBool(AppStrings.theme) : false ;
  }

}