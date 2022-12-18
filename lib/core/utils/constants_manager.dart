import 'package:flutter/material.dart';


/// AppConstants class is used to manage the frequently used methods & widgets

class AppConstants {
  // Widgets

  static showAppUpdateDialog(
      {required BuildContext context, required bool isForce}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              AppStrings.updateAvailable.tr(),
              style: mediumTextStyle(
                fontSize: FontSize.sp18,
                color: ColorsManager.primary,
              ),
            ),
            content: Text(AppStrings.updateToContinue.tr()),
            actions: [
              if (!isForce)
                TextButton(
                  onPressed: () {
                    pop(context);
                  },
                  child: Text(
                    AppStrings.cancel.tr(),
                    style: mediumTextStyle(
                      fontSize: FontSize.sp16,
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {
                  // pop(context);
                  launchAppStore();
                },
                child: Text(
                  AppStrings.update.tr(),
                  style: mediumTextStyle(
                    fontSize: FontSize.sp16,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          );
        });
  }

  static Future<void> showToast({
    required BuildContext context,
    String? title,
    required String message,
    ToastType toastType = ToastType.error,
    FlushbarPosition toastGravity = FlushbarPosition.TOP,
    int duration = toastDuration,
  }) {
    return Flushbar(
      titleText: Text(
        title ??
            (toastType == ToastType.error
                ? AppStrings.error.tr()
                : toastType == ToastType.success
                    ? AppStrings.done.tr()
                    : AppStrings.warning.tr()),
        style: mediumTextStyle(color: ColorsManager.white),
      ),
      messageText: Text(
        message,
        style: regularTextStyle(
          color: ColorsManager.white,
          fontSize: FontSize.sp18,
        ),
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      duration: Duration(milliseconds: duration),
      flushbarPosition: toastGravity,
      backgroundColor: toastType == ToastType.error
          ? ColorsManager.red
          : toastType == ToastType.success
              ? ColorsManager.green
              : ColorsManager.yellow,
      icon: Icon(
        toastType == ToastType.error
            ? Icons.close_outlined
            : toastType == ToastType.success
                ? Icons.done_outlined
                : Icons.error_outline_outlined,
        color: Colors.white,
        size: AppSize.s40,
      ),
      shouldIconPulse: true,
    ).show(context);
  }

  static Widget showLoadingIndicator() {
    return const Center(
      child: SpinKitFadingCircle(
        color: ColorsManager.primary,
      ),
    );
  }

  static Widget vSize(double value) => SizedBox(height: value);

  static Widget hSize(double value) => SizedBox(width: value);

  // Navigation

  static void navigateTo(BuildContext context, String route,
      {Object? argument}) {
    Navigator.of(context).pushNamed(route, arguments: argument);
  }

  static void navigateAndReplace(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void pop(BuildContext context) => Navigator.of(context).pop();

  static Future<void> launchAppStore() async {
    if (await launcher.canLaunchUrlString(dotsAppStoreUrl)) {
      await launcher.launchUrlString(dotsAppStoreUrl,
          mode: LaunchMode.externalNonBrowserApplication);
    } else {
      debugPrint('------- launchAppStore ERROR -------');
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: "tel", path: phoneNumber);
    try {
      if (await launcher.canLaunchUrlString(phoneUri.toString())) {
        await launcher.launchUrlString(phoneUri.toString());
      }
    } catch (error) {
      throw ("Cannot dial");
    }
  }

  // Numbers

  static const int passwordLength = 6;

  static const int toastDuration = 2000;

  static const int splashDelay = 2500;

  // Strings

  static String? uid;

  static String pageStorageKey = 'pageStorageKey';

  static const String languageCode = 'language_code';

  static const Locale englishLocale = Locale('en');

  static const Locale arabicLocale = Locale('ar');

  static const String enLangCode = 'en';

  static const String arLangCode = 'ar';

  static const List<Locale> supportedLocales = [
    englishLocale,
    arabicLocale,
  ];

  static const String isFirstAppLaunch = 'isFirstAppLaunch';
  static const String locationScanInterval = 'locationScanInterval';
  static const String userTerritory = 'userTerritory';
  static const String locationNotificationTitle = 'Background Location Service';
  static const String locationNotificationBody = 'Sharing Location';
  static const String brandBarcodeScannerKey = 'brand-barcode-scanner-key';
  static const String visibleDetectorHomeBrandKey =
      'visible-detector-home-brand-key';
  static const String salesmanMobileAccess= 'salesman';
  static const String salesman= 'SALESMAN';
  static const String deviceAndroid= 'ANDROID';
  static const String deviceIOS = 'IOS';
  static const String store = 'STORE';
  static const String cash = 'CASH';

  static const String NA = "N/A";
  static const String DEFAULT_CURRENCY = 'SAR';

  //URL
  static const String dotsAppStoreUrl =
      'https://play.google.com/store/apps/details?id=com.aiia_solutions.salesman';


}
