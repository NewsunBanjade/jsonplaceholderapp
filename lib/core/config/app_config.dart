import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConfig {
  static const EdgeInsets kDefaultPadding =
      EdgeInsets.symmetric(horizontal: 15, vertical: 10);
  static showErrorToast(String message) => Fluttertoast.showToast(
      msg: message, backgroundColor: Colors.red, gravity: ToastGravity.BOTTOM);
}
