import 'package:flutter/material.dart';
import 'package:salesman_mobile/core/utils/colors_manager.dart';
import 'package:salesman_mobile/core/utils/font_manager.dart';

/// These are the most used text styles overall the application

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle thinTextStyle({
  double fontSize = FontSize.sp10,
  Color color = ColorsManager.grey,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.thin,
    color: color,
  );
}

TextStyle extraLightTextStyle({
  double fontSize = FontSize.sp12,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.extraLight,
    color: color,
  );
}

TextStyle lightTextStyle({
  double fontSize = FontSize.sp14,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle regularTextStyle({
  double fontSize = FontSize.sp16,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle mediumTextStyle({
  double fontSize = FontSize.sp18,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle semiBoldTextStyle({
  double fontSize = FontSize.sp20,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}

TextStyle boldTextStyle({
  double fontSize = FontSize.sp22,
  Color color = ColorsManager.black,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}
