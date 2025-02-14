import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/receipt_screen.dart';

import '../../../../core/connect_end/model/get_stats_response_model/transaction.dart';
import '../../core/connect_end/model/get_stats_response_model/swap.dart';
import '../widget/text_widget.dart';
import 'app_color.dart';

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

paddedWing({Widget? child, double? value}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: value!.w),
      child: child,
    );

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

homeTransFlowWidget(
        {required String image,
        required String text,
        required Color color,
        required Function() onTap}) =>
    Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(14.2.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primary.withOpacity(.3))),
            child: SvgPicture.asset(image),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextView(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: color,
        )
      ],
    );

sendTransFlowWidget(
        {required String image,
        required String text,
        required Color color,
        required Function() onTap}) =>
    Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10.2.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.primary.withOpacity(.3))),
            child: SvgPicture.asset(
              image,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextView(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: color,
        )
      ],
    );

recentTransWidget({context, required Transaction e}) => GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReceiptScreen(
                  e: e,
                )),
      ),
      child: Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.only(bottom: 10.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.inGrey),
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: e.type?.capitalize() ?? "",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.darkGrey,
                ),
                TextView(
                  text: DateFormat('yyyy-MM-dd hh:mm a')
                      .format(DateTime.parse(e.createdAt.toString())),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColor.darkGrey,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  text: e.status?.toLowerCase() == 'completed'
                      ? 'Successful'
                      : e.status!.capitalize(),
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                  color: e.status?.toLowerCase() == 'completed'
                      ? AppColor.green
                      : e.status?.toLowerCase() == 'pending'
                          ? AppColor.grey
                          : AppColor.red,
                ),
                TextView(
                  text:
                      '${getCurrency()}${oCcy.format(double.parse(e.amount!))}',
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: e.status?.toLowerCase() == 'completed'
                        ? AppColor.green
                        : e.status?.toLowerCase() == 'pending'
                            ? AppColor.grey
                            : AppColor.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

recentSwapTransWidget({context, required Swap e}) => Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(bottom: 10.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.inGrey),
        borderRadius: BorderRadius.circular(12),
        color: AppColor.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: "${e.fromCurrency} - ${e.toCurrency}",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.darkGrey,
              ),
              TextView(
                text: DateFormat('yyyy-MM-dd hh:mm a')
                    .format(DateTime.parse(e.createdAt.toString())),
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColor.darkGrey,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextView(
                text: e.status?.toLowerCase() == 'approved'
                    ? 'Successful'
                    : e.status!.capitalize(),
                fontSize: 13.2.sp,
                fontWeight: FontWeight.w400,
                color: e.status?.toLowerCase() == 'approved'
                    ? AppColor.green
                    : e.status?.toLowerCase() == 'pending'
                        ? AppColor.grey
                        : AppColor.red,
              ),
              TextView(
                text:
                    '${getAllCurrency(e.fromCurrency)}${oCcy.format(double.parse(e.fromAmount!))} - ${getAllCurrency(e.toCurrency)}${oCcy.format(double.parse(e.toAmount!))}',
                textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: e.status?.toLowerCase() == 'approved'
                      ? AppColor.green
                      : e.status?.toLowerCase() == 'pending'
                          ? AppColor.grey
                          : AppColor.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
