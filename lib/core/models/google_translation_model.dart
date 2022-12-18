class GoogleTranslationModel {
  final String? translatedText;
  final String? detectedSourceLanguage;

  GoogleTranslationModel(
      {required this.translatedText, required this.detectedSourceLanguage});
}
