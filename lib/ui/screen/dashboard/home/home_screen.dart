import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/receipt_screen.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_assets/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  paddedWing({Widget? child, double? value}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value!.w),
        child: child,
      );

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 25.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            paddedWing(
              value: 8.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.2.w),
                    decoration: const BoxDecoration(
                      color: AppColor.inGrey,
                      shape: BoxShape.circle,
                    ),
                    child: TextView(
                      text: 'JD',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextView(
                    text: 'Welcome John',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SvgPicture.asset(AppImage.bell)
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            paddedWing(
                value: 8.w,
                // ignore: avoid_unnecessary_containers
                child: Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(14)),
                  child: paddedWing(
                    value: 16.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextView(
                              text: 'Available Balance',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.white,
                            ),
                            TextView(
                              text: isTapped ? 'N9,900,000,000.00' : '********',
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.white,
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () => setState(() => isTapped = !isTapped),
                            child: SvgPicture.asset(
                                isTapped ? AppImage.openEye : AppImage.eye))
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 40.h),
            paddedWing(
                value: 8.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeTransFlowWidget(
                        image: AppImage.homeSwap, text: 'Swap', onTap: () {}),
                    homeTransFlowWidget(
                        image: AppImage.addCard,
                        text: 'Deposit',
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DepositScreen()),
                            )),
                    homeTransFlowWidget(
                        image: AppImage.homeHelp,
                        text: 'Get Help',
                        onTap: () {}),
                  ],
                )),
            SizedBox(height: 46.h),
            paddedWing(
              value: 8.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextView(
                    text: 'Recent Transaction',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.darkGrey,
                  ),
                  TextView(
                    text: 'View All',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ...[1, 2, 3].map((e) => recentTransWidget(
                e: e,
                text: 'Deposit',
                textValue: e == 1
                    ? 'Successful'
                    : e == 2
                        ? 'Pending'
                        : 'Failed',
                time: 'Today, 3:00 PM',
                amount: '5,000 NGN -> 25 USD'))
          ],
        ),
      ),
    );
  }

  homeTransFlowWidget(
          {required String image,
          required String text,
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
            color: AppColor.darkGrey,
          )
        ],
      );

  recentTransWidget(
          {required String text,
          required String textValue,
          required String time,
          required int e,
          required String amount}) =>
      GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReceiptScreen()),
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
                    text: text,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                  TextView(
                    text: time,
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
                    text: textValue,
                    fontSize: 13.2.sp,
                    fontWeight: FontWeight.w400,
                    color: e == 1
                        ? AppColor.green
                        : e == 2
                            ? AppColor.grey
                            : AppColor.red,
                  ),
                  TextView(
                    text: amount,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
