import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_gate_pay/alipay.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_gate_pay/paypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widget/text_widget.dart';
import 'deposit_gate_pay/flutter.dart';
import 'deposit_gate_pay/paystack.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  paddedWing({Widget? child, double? vertical, double? horizontal}) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: vertical!.w, horizontal: horizontal!.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColor.light,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              paddedWing(
                vertical: 2,
                horizontal: 16,
                child: Row(
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
                      text: 'Deposit',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              TabBar(
                indicatorColor: AppColor.primary,
                dividerColor: AppColor.transparent,
                labelPadding: EdgeInsets.only(bottom: 4.w),
                padding: EdgeInsets.zero,
                tabs: [
                  TextView(
                    text: 'Paystack',
                    fontSize: 14.sp,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextView(
                    text: 'Alipay',
                    fontSize: 14.sp,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextView(
                    text: 'Paypal',
                    fontSize: 14.sp,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  TextView(
                    text: 'Flutterwave',
                    fontSize: 14.sp,
                    color: AppColor.darkGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              paddedWing(
                vertical: 10,
                horizontal: 24,
                child: SizedBox(
                  height: 740.h,
                  child: const TabBarView(
                    children: <Widget>[
                      PaystackScreen(),
                      AlipayScreen(),
                      PaypalScreen(),
                      FlutterScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
