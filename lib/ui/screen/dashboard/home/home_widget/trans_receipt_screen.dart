import 'package:daalu_pay/core/connect_end/model/get_swapped_transactions_response_model/datum.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class TransReceiptScreen extends StatelessWidget {
  TransReceiptScreen({super.key, required this.e});
  Datum e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColor.inGrey,
                      size: 20.sp,
                    )),
                TextView(
                  text: 'Receipt',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.only(bottom: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.inGrey),
                borderRadius: BorderRadius.circular(12),
                color: AppColor.white,
              ),
              child: Column(
                children: [
                  contContainer(
                      left: 'Time',
                      right: DateFormat('MMM dd, yyyy hh:mm a')
                          .format(DateTime.parse(e.createdAt.toString()))),
                  contContainer(
                      left: 'Transaction ID',
                      right: e.transactionId.toString()),
                  contContainer(
                      left: 'Exchange Rate', right: e.rate.toString()),
                  contContainer(
                      left: 'From',
                      right:
                          '${getAllCurrency(e.fromCurrency)}${oCcy.format(roundToTwoDecimals(double.parse(e.fromAmount!)))}'),
                  contContainer(
                      left: 'To',
                      right:
                          '${getAllCurrency(e.toCurrency)}${oCcy.format(roundToTwoDecimals(double.parse(e.toAmount!)))}'),
                  contContainer(
                      left: 'State',
                      right: e.status == 'completed'
                          ? 'Success'
                          : e.status?.capitalize()),
                  // contContainer(left: 'Not Received', right: '49.99 USD'),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'For assistance, contact our support team at',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.darkGrey,
            ),
            TextView(
              text: 'support@daalupay.com.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.primary,
            ),
          ],
        ),
      ),
    );
  }

  contContainer({required left, required right}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: TextView(
                  text: left,
                  fontSize: 20.sp,
                  maxLines: 1,
                  textOverflow: TextOverflow.fade,
                  fontWeight: FontWeight.w400,
                  color: AppColor.darkGrey,
                ),
              ),
              SizedBox(
                width: 160.w,
                child: TextView(
                  text: right,
                  textStyle: TextStyle(
                    fontSize: 18.sp,
                  ),
                  maxLines: 1,
                  textOverflow: TextOverflow.fade,
                  fontWeight: FontWeight.w300,
                  color: AppColor.darkGrey,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.2.h),
          Divider(
            color: AppColor.inGrey,
            thickness: 1.sp,
          ),
          SizedBox(height: 1.2.h),
        ],
      );
}
