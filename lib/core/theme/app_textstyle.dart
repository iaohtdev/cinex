import 'package:flutter/material.dart';

class AppTextStyles {
  static String fontRegular = 'Josefin';
  static String fontBold = 'Josefin-Bold';
  static TextStyle textStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        height: height,
        fontSize: fontSize ?? 14,
        decoration: decoration,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontFamily ?? fontRegular);
  }

  static TextStyle textStyleBold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        height: height,
        fontSize: fontSize ?? 14,
        decoration: decoration,
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: fontBold);
  }

  static TextStyle l1() {
    return TextStyle(
        fontFamily: AppTextStyles.fontBold, fontSize: 30, color: Colors.white);
  }

  static TextStyle l2() {
    return TextStyle(
        fontFamily: AppTextStyles.fontBold, fontSize: 26, color: Colors.white);
  }

  static TextStyle l3() {
    return TextStyle(
        fontFamily: AppTextStyles.fontBold, fontSize: 22, color: Colors.white);
  }
}
