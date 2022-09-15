import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension StatusBarExtension on BuildContext {
  void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: color,
    ));
  }
}