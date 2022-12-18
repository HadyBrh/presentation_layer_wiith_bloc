import 'dart:async';

import 'package:core_flutter_package/core_flutter_package.dart' as core;
import 'package:flutter/material.dart';
import 'package:presentation_layer/config/helpers/cache_helper.dart';
import 'package:presentation_layer/core/utils/constants_manager.dart';
import 'package:presentation_layer/app/dependency_injection.dart' as di;


class SplashViewModel {
  Timer? _timer;

  String _nextScreen() {
    if (di
            .serviceLocator<CacheHelper>()
            .getData(key: AppConstants.isFirstAppLaunch) ??
        true) {
      return Routes.requestLocationPermissionRoute;
    } else {
      if (core.locator<core.UserService>().isAuthenticated()) {
        return Routes.homeRoute;
      } else {
        return Routes.loginRoute;
      }
    }
  }

  _goNext(BuildContext context) {
    AppConstants.navigateAndReplace(context, _nextScreen());
  }

  startDelay(BuildContext context) {
    _timer = Timer.periodic(
        const Duration(milliseconds: AppConstants.splashDelay), (timer) {
      _goNext(context);
    });
  }

  void dispose() {
    _timer!.cancel();
    _timer = null;
  }
}
