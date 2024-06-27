import 'package:flutter/material.dart';

class AppConstants {
  static const double pHorizontal = 16;
  static const height2 = SizedBox(height: 2);
  static const height4 = SizedBox(height: 4);
  static const height5 = SizedBox(height: 5);
  static const height8 = SizedBox(height: 8);
  static const height10 = SizedBox(height: 10);
  static const height12 = SizedBox(height: 12);
  static const height14 = SizedBox(height: 14);
  static const height16 = SizedBox(height: 16);
  static const height18 = SizedBox(height: 18);
  static const height20 = SizedBox(height: 20);
  static const height24 = SizedBox(height: 24);
  static const height30 = SizedBox(height: 30);

  static const width2 = SizedBox(width: 2);
  static const width4 = SizedBox(width: 4);
  static const width5 = SizedBox(width: 5);
  static const width8 = SizedBox(width: 8);
  static const width10 = SizedBox(width: 10);
  static const width20 = SizedBox(width: 20);
  static const double heightBtn = 55;

  static SizedBox heigthCustom(double height) {
    return SizedBox(height: height);
  }

  static SizedBox widthCustom(double? width) {
    return SizedBox(width: width ?? 10);
  }

  static Container divier({double? height, Color? color}) {
    return Container(
      color: color ?? Colors.grey,
      width: double.infinity,
      height: height ?? 0.5,
    );
  }
}
