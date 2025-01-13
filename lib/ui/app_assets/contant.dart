// import 'package:intl/intl.dart';
// import 'dart:io';

// String getCurrency() {
//   var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
//   return format.currencySymbol;
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

paddedWing({Widget? child, double? value}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: value!.w),
      child: child,
    );

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

final oCcy = NumberFormat("#,##0.00", "en_US");

String getCurrency() {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}

String getAllCurrency(c) {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: c);
  return format.currencySymbol;
}

String getInitials(String text) => text.isNotEmpty
    ? text.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';
