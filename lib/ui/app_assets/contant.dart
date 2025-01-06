import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:intl/intl.dart';

final oCcy = NumberFormat("#,##0.00", "en_US");

String getCurrency() {
  var format =
      NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
  return format.currencySymbol;
}

String getInitials(String text) => text.isNotEmpty
    ? text.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';

paddedWing({Widget? child, double? value}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: value!.w),
      child: child,
    );
