enum TranslateLanguage { en, ar }

String getTranslateLanguageString(
  TranslateLanguage translateLanguage,
) {
  return translateLanguage.toString().split('.').last;
}
