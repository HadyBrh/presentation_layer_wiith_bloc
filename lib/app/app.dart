import 'package:core_flutter_package/core_flutter_package.dart' as core;
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesman_mobile/app/app_bloc_observer.dart';
import 'package:salesman_mobile/app/dependency_injection.dart' as di;
import 'package:salesman_mobile/config/locale/locale_manager.dart';
import 'package:salesman_mobile/config/routes/app_routes.dart';
import 'package:salesman_mobile/core/services/background_location_service.dart';
import 'package:salesman_mobile/core/services/local_notifications_service.dart';
import 'package:salesman_mobile/core/services/notification_stream.dart';
import 'package:salesman_mobile/core/services/push_notification_service.dart';
import 'package:salesman_mobile/core/utils/assets_manager.dart';
import 'package:salesman_mobile/core/utils/constants_manager.dart';
import 'package:salesman_mobile/core/utils/theme_manager.dart';
import 'package:salesman_mobile/firebase_options.dart';
import 'package:salesman_mobile/view_models/brands_list/brands_list_view_model.dart';
import 'package:salesman_mobile/view_models/categories_list/categories_list_view_model.dart';
import 'package:salesman_mobile/view_models/create_store/create_store_view_model.dart';
import 'package:salesman_mobile/view_models/dashboard/dashboard_view_model.dart';
import 'package:salesman_mobile/view_models/order_home/order_home_view_model.dart';
import 'package:salesman_mobile/view_models/products_list/products_list_view_model.dart';
import 'package:salesman_mobile/view_models/store_summary/store_summary_view_model.dart';
import 'package:salesman_mobile/view_models/stores_list/stores_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:salesman_mobile/view_models/transaction_filter/transaction_filter_dialog_view_model.dart';
import 'package:salesman_mobile/view_models/transaction_list/transaction_history_view_model.dart';
import 'package:firebase_core/firebase_core.dart';


Future<Widget> initializeApp(core.AppConfig appConfig) async {
  debugPrint('-------- App Config Flavor -------- \n ${appConfig.flavor}');
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Setup App Service Locator
  di.init();

  /// Setup Core Library Locator
  core.setupLocator();

  core.locator<core.AppConfig>().flavor = appConfig.flavor;

  /// Initialise Shared Preferences
  await core.locator<core.SharedPrefs>().init();

  core.locator<core.UserService>().initialise();

  di.serviceLocator<LocalNotificationsService>().init();

  Bloc.observer = AppBlocObserver();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // FirebaseMessaging.onBackgroundMessage();
  /// Setup Firebase Notification
  if (core.locator<core.UserService>().isAuthenticated()) {

    await PushNotificationService().initialize(messaging);
  }

  return EasyLocalization(
    supportedLocales: AppConstants.supportedLocales,
    path: translationsPath,
    fallbackLocale: AppConstants.englishLocale,
    startLocale: di.serviceLocator<LocaleManager>().getLocale(),
    saveLocale: true,
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => core.CartCounterNotifier()),
        ChangeNotifierProvider(create: (context) => NotificationNotifier()),
      ],
      child: const MyApp(),
    ),
    // child: const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void dispose() {
    di.serviceLocator<BackgroundLocationService>().stopSharingLocation();
    super.dispose();
  }

  @override
  void deactivate() {
    di.serviceLocator<BackgroundLocationService>().stopSharingLocation();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salesman',
        theme: appTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.initialRoute,
      ),
    );
  }
}