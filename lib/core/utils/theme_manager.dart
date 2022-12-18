import 'package:flutter/material.dart';
import 'package:salesman_mobile/core/utils/colors_manager.dart';
import 'package:salesman_mobile/core/utils/text_styles_manager.dart';
import 'package:salesman_mobile/core/utils/values_manager.dart';

import 'font_manager.dart';

/// appTheme is used to handle the ui flavor of the most used widgets
///

ThemeData appTheme = ThemeData(
  // main colors of the app
  primaryColor: ColorsManager.primary,
  primarySwatch: ColorsManager.primarySwatch,
  primaryColorLight: ColorsManager.primaryOpacity70,
  primaryColorDark: ColorsManager.darkPrimary,
  disabledColor: ColorsManager.grey1,

  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      color: ColorsManager.white,
    ),
  ),

  iconTheme: const IconThemeData(
    size: AppSize.s30,
    color: ColorsManager.primary,
  ),

  backgroundColor: ColorsManager.white,
  unselectedWidgetColor: ColorsManager.primary,
  scaffoldBackgroundColor: ColorsManager.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorsManager.grey1,
    selectedItemColor: ColorsManager.primary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedIconTheme: const IconThemeData(
      color: ColorsManager.primary,
    ),
    selectedLabelStyle: regularTextStyle(
      color: ColorsManager.primary,
    ),
  ),
  // App bar theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    iconTheme: const IconThemeData(
      color: ColorsManager.white,
      size: AppSize.s28,
    ),
    titleTextStyle: mediumTextStyle(
      color: ColorsManager.white,
      fontSize: FontSize.sp18,
    ),
    elevation: AppSize.s4,
    shadowColor: ColorsManager.primaryOpacity70,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorsManager.primary,
    foregroundColor: ColorsManager.white,
  ),

  // card view theme
  cardTheme: CardTheme(
    color: ColorsManager.white,
    shadowColor: ColorsManager.primaryOpacity70,
  ),

  // Button theme
  buttonTheme: const ButtonThemeData(
    shape: StadiumBorder(),
    buttonColor: ColorsManager.primary,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: regularTextStyle(
        color: ColorsManager.white,
      ),
      backgroundColor: ColorsManager.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s4),
      ),
    ),
  ),
  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: regularTextStyle(),
  ),
);
