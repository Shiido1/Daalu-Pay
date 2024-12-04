import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/text_widget.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

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
                  contContainer(left: 'Time', right: 'Nov 10, 2024 5:30 AM'),
                  contContainer(left: 'Transaction ID', right: '#1234567'),
                  contContainer(left: 'From', right: '10,000 NGN'),
                  contContainer(left: 'To', right: '50 USD'),
                  contContainer(
                      left: 'Exchange Rate', right: '1 USD = 500 NGN'),
                  contContainer(left: 'State', right: 'Success'),
                  contContainer(left: 'Transaction Fee', right: '500 NGN'),
                  contContainer(left: 'Not Received', right: '49.99 USD'),
                  contContainer(left: 'Payment Method', right: 'flutterwave'),
                  contContainer(
                      left: 'Amount added to wallet',
                      right: '49.99 USD (USD Wallet)'),
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
              TextView(
                text: left,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.darkGrey,
              ),
              TextView(
                text: right,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColor.darkGrey,
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
