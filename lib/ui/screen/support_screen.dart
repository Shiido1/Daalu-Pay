import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/core_folder/app/app.router.dart';
import '../../main.dart';
import '../app_assets/app_color.dart';
import '../widget/text_widget.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.light,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
          child: Column(
            children: [
              TextView(
                text: 'Support',
                color: AppColor.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 20.h,
              ),
              TextView(
                text: 'Find answers to questions or contact us directly.',
                color: AppColor.black,
                fontSize: 17.2.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 70.h,
              ),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.primary),
                child: SvgPicture.asset(AppImage.support),
              ),
              SizedBox(
                height: 120.h,
              ),
              GestureDetector(
                onTap: () => navigate.navigateTo(Routes.webviewChatScreen),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 14.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: AppColor.black,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          TextView(
                            text: 'Live Chat',
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
