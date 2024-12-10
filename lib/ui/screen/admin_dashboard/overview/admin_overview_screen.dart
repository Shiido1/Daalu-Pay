import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../widget/text_widget.dart';

class AdminOverviewScreen extends StatefulWidget {
  const AdminOverviewScreen({super.key});

  @override
  State<AdminOverviewScreen> createState() => _AdminOverviewScreenState();
}

class _AdminOverviewScreenState extends State<AdminOverviewScreen> {
  bool isTapped = false;
  bool? isSwitched;

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
                  text: 'Overview',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                overviewTransWidget(
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: AppColor.yellow,
                      size: 32.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Pending Transactions'),
                SizedBox(
                  width: 10.w,
                ),
                overviewTransWidget(
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: AppColor.green,
                      size: 32.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Approved Transactions'),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                overviewTransWidget(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: AppColor.red,
                      size: 32.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Pending Transactions'),
                SizedBox(
                  width: 10.w,
                ),
                overviewTransWidget(
                    icon: SizedBox(
                      width: 200,
                      child: TextView(
                        text: 'EXCHANGE RATE',
                        fontSize: 13.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        color: AppColor.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    text: TextView(
                      text: '1 USD = 1500 NGN ',
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    text1: 'Updated- 2 mins ago'),
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Pending Transactions',
                  color: AppColor.greyKind,
                  fontSize: 16.sp,
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
              height: 14.0.h,
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
              height: 80.h,
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
              height: 20.h,
            ),
            ...[1, 2, 3].map((o) => Container(
                  padding: EdgeInsets.all(18.w),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: '5,000 NGN -> 25 USD',
                            color: AppColor.green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 6.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.green.withOpacity(.2),
                            ),
                            child: TextView(
                              text: 'Approved',
                              fontSize: 14.sp,
                              color: AppColor.green,
                              fontWeight: FontWeight.w500,
                            ),
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

  overviewTransWidget(
          {required Widget icon,
          required Widget text,
          required String text1}) =>
      Expanded(
        child: Container(
          padding:
              EdgeInsets.only(top: 10.w, bottom: 10.w, right: 54.w, left: 10.w),
          decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                color: AppColor.inGrey,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                height: 2.4.w,
              ),
              text,
              SizedBox(
                height: 2.4.w,
              ),
              SizedBox(
                width: 380.w,
                child: TextView(
                  text: text1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 14.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );
}
