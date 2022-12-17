
abstract class ThemeLocalDataSource {
  Future<bool> changeTheme({required bool isDark});
  Future<bool?> getSavedTheme();
}