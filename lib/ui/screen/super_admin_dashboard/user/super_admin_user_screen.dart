import 'package:daalu_pay/ui/widget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class SuperAdminUsersScreen extends StatelessWidget {
  const SuperAdminUsersScreen({super.key});

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
                  text: 'User Management',
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
                Expanded(
                  child: TextFormWidget(
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
                ),
                SizedBox(
                  width: 18.w,
                ),
                SvgPicture.asset(AppImage.filter)
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'App Users',
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 14.w),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(color: AppColor.inGrey),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Name',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TextView(
                          text: 'Email',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TextView(
                          text: 'Status',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.inGrey,
                    thickness: .3.sp,
                  ),
                  ...[
                    1,
                    1,
                    1,
                    1,
                    1,
                  ].map((i) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 80.w,
                                child: TextView(
                                  text: 'John Doe',
                                  fontSize: 14.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 140.w,
                                child: TextView(
                                  text: 'john.doe@gmail.com',
                                  fontSize: 14.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 5.2.w),
                                decoration: BoxDecoration(
                                    color: AppColor.green.withOpacity(.17),
                                    borderRadius: BorderRadius.circular(4)),
                                child: TextView(
                                  text: 'Active',
                                  fontSize: 12.4.sp,
                                  color: AppColor.deeperGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: AppColor.inGrey,
                            thickness: .3.sp,
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
