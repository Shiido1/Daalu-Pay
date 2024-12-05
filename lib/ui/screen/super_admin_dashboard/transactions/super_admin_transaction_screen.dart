import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class SuperAdminTransactionScreen extends StatelessWidget {
  const SuperAdminTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 36.0.w,
                  height: 50.h,
                ),
                TextView(
                  text: 'Pending Tansactions',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SvgPicture.asset(
                  AppImage.person,
                  color: AppColor.primary,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 16.w),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(color: AppColor.inGrey),
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Jane Doe',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      TextView(
                        text: 'Today, 3:00 PM',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.grey,
                      ),
                    ],
                  ),
                  TextView(
                    text: 'ID- #81671ABO',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextView(
                    text: '5000 NGN to 9 USD',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            color: AppColor.green.withOpacity(.17),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline_outlined,
                              size: 24.sp,
                              color: AppColor.deeperGreen,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            TextView(
                              text: 'Approved',
                              fontSize: 12.4.sp,
                              color: AppColor.deeperGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            color: AppColor.red.withOpacity(.17),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.cancel_outlined,
                              size: 24.sp,
                              color: AppColor.red,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            TextView(
                              text: 'Reject',
                              fontSize: 12.4.sp,
                              color: AppColor.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            color: AppColor.greyKind.withOpacity(.17),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 24.sp,
                              color: AppColor.greyNice,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            TextView(
                              text: 'Hold',
                              fontSize: 12.4.sp,
                              color: AppColor.greyNice,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Recent Transactions',
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
                            text: 'Jane Doe',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: 'ID- #81671ABO',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextView(
                            text: 'Today, 3:00 PM',
                            fontSize: 14.sp,
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
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.w),
                            decoration: BoxDecoration(
                                color: AppColor.green.withOpacity(.17),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextView(
                              text: 'Approved',
                              fontSize: 12.4.sp,
                              color: AppColor.deeperGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
