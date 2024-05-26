import 'package:flutter/material.dart';

class AppCommon {
  static void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
