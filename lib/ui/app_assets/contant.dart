// import 'package:intl/intl.dart';
// import 'dart:io';

// String getCurrency() {
//   var format = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
//   return format.currencySymbol;
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

paddedWing({Widget? child, double? value}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: value!.w),
      child: child,
    );
