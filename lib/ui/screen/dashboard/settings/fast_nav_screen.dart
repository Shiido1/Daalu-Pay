import 'package:daalu_pay/ui/screen/dashboard/home/exchange_rate_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/settings/setting_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/wallet/send_money.dart';
import 'package:daalu_pay/ui/screen/profile_screen.dart';
import 'package:daalu_pay/ui/screen/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';
import '../transaction/transaction_screen.dart';

class FastNavScreen extends StatelessWidget {
  const FastNavScreen({super.key});

  paddedWind({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.w),
        child: child,
      );

  paddedWindNot({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.w),
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
              text: 'Menu',
              fontSize: 22.0.sp,
              fontWeight: FontWeight.w600,
            )),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'Send & Transfer',
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contxt) => SendMoneyScreen()),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.send,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Send Money',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'Wallet & Payment Methods',
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contxt) => DepositScreen()),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.addCard,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Fund Wallet',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'Exchange & Rates',
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxt) => ExchangeRateScreen()),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_exchange,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'View Exchange Rates',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (contxt) => TransactionScreen()),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.monitor_heart_outlined,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 230.w,
                          child: TextView(
                            text: 'Transaction History / Activity',
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'Profile & Support',
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.white),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contxt) => ProfileScreen()),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_3_outlined,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Profile',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contxt) => SupportScreen()),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.support,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Support',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contxt) => SettingScreen()),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.security,
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Security / Settings',
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  GestureDetector(
                    onTap: () => SharedPreferencesService.instance.logOut(),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: AppColor.red,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextView(
                          text: 'Logout',
                          fontSize: 18.0.sp,
                          color: AppColor.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
