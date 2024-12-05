import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  paddedWind({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: TextView(
              text: 'Settings',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            )),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: const BoxDecoration(
                      color: AppColor.inGrey, shape: BoxShape.circle),
                  child: TextView(
                    text: 'JD',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'John Doe',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    TextView(
                      text: 'john.doe@gmail.com',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.textColor,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'ACCOUNT',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Your Profile',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Account Verification',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Notification',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextView(
              text: 'FINANCES',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: paddedWind(
                child: TextView(
                  text: 'Transaction Limits',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextView(
              text: 'SECURITY',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Change Password',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Two Factor Authentication',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  paddedWind(
                    child: TextView(
                      text: 'Change Pin',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
