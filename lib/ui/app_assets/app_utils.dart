import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class AppUtils {
  static Future<void> snackbar(BuildContext? context,
      {String? title, required String? message, bool error = false}) {
    return Flushbar(
      title: error ? 'Oopss!' : 'Great!',
      titleColor: Colors.white,
      message: message == 'Null check operator used on a null value'
          ? 'Connection to server failed due to internet connection, please check and try again'
          : message,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 1),
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: error ? Colors.red : Colors.green,
    ).show(context!);
  }
}
