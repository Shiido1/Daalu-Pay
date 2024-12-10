import 'package:daalu_pay_admin/ui/widget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class SuperAdminNotificationScreen extends StatelessWidget {
  const SuperAdminNotificationScreen({super.key});

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
                  text: 'Notification',
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
            TextFormWidget(
              label: 'Search',
              labelColor: AppColor.grey,
              hint: null,
              border: 10,
              borderColor: AppColor.transparent,
              isFilled: true,
              fillColor: AppColor.inGreyOut,
              prefixWidget: Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  AppImage.search,
                ),
              ),
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'Today',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 16.w, right: 0.w, left: 16.w, bottom: 16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.white,
                  border: Border.all(color: AppColor.inGrey)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.2.w),
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
                  SizedBox(
                    width: 16.2.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Attention needed',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        width: 180.w,
                        child: TextView(
                          text:
                              'An Admin recently flagged an account Due to suspicion of fraud and,An Admin recently flagged an account Due to suspicion of fraud and',
                          fontSize: 12.sp,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  TextView(
                    text: 'Today, 3:00 PM',
                    fontSize: 11.2.sp,
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
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
