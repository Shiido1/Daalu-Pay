import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_color.dart';
import '../../../widget/text_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
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
                  text: 'Wallet',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.inGrey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            ...[1, 2, 3].map((e) => Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.only(bottom: 16.w),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.inGrey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.w),
                        child: SvgPicture.asset(AppImage.nigeria),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Nigerian Naira (NGN)',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: '#0.00',
                            fontSize: 18.sp,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Transaction History',
                  color: AppColor.greyKind,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                TextView(
                  text: 'View All',
                  color: AppColor.grey,
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ...[1, 2, 3].map((o) => Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.only(bottom: 16.w),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.inGrey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'ID- #81671ABO',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: 'Today, 3:00 PM',
                            fontSize: 12.sp,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextView(
                            text: '5,000 NGN -> 25 USD',
                            color: AppColor.green,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: 'Successful',
                            fontSize: 12.sp,
                            color: AppColor.green,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
