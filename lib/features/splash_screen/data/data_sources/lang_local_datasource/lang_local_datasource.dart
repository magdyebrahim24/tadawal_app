
abstract class LanguageLocalDataSource{

  Future<bool> changeLang({required String langCode});

  Future<String?> getSavedLang();
}