import 'package:flutter/material.dart';
import 'package:salesman_mobile/config/helpers/cache_helper.dart';
import 'package:salesman_mobile/core/utils/constants_manager.dart';

class LocaleManager {
  final CacheHelper _cacheHelper;
  LocaleManager(this._cacheHelper);

  Locale getLocale() {
    switch (_cacheHelper.getData(key: AppConstants.languageCode) ??
        AppConstants.enLangCode) {
      case AppConstants.enLangCode:
        return AppConstants.englishLocale;

      case AppConstants.arLangCode:
        return AppConstants.arabicLocale;

      default:
        return AppConstants.englishLocale;
    }
  }

  void setLocale(Locale locale) {
    _cacheHelper
        .saveData(
          key: AppConstants.languageCode,
          value: locale.languageCode,
        )
        .then((value) =>
            debugPrint('------- ${locale.languageCode} Language Cached -----'));
  }
}
