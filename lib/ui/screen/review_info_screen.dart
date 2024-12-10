import 'package:daalu_pay_admin/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../app_assets/app_color.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

class ReviewInfoScreen extends StatelessWidget {
  const ReviewInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                      child: TextView(
                        text: 'Personal Information',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey,
                      ),
                    ),
                    Divider(
                      color: AppColor.inGrey,
                      thickness: .5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Column(
                        children: [
                          TextFormWidget(
                            label: 'John Doe',
                            hint: null,
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                AppImage.pen,
                              ),
                            ),
                            // controller: emailController,
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormWidget(
                            label: '12/12/2024',
                            hint: null,
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                AppImage.pen,
                              ),
                            ),
                            // controller: emailController,
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormWidget(
                            label: 'Nigeria',
                            hint: null,
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                AppImage.pen,
                              ),
                            ),
                            // controller: emailController,
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormWidget(
                            label: '+234 904 4344 343',
                            hint: null,
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                AppImage.pen,
                              ),
                            ),
                            // controller: emailController,
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormWidget(
                            label: 'john.doe@gmail.com',
                            hint: null,
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            suffixWidget: Padding(
                              padding: EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                AppImage.pen,
                              ),
                            ),
                            // controller: emailController,
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Card(
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                      child: TextView(
                        text: 'Your Documents',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey,
                      ),
                    ),
                    Divider(
                      color: AppColor.inGrey,
                      thickness: .5.w,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Driver’s License',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkGrey,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                            ),
                            height: 125.0.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColor.greyKind,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: TextView(
                                text: ' preview of the uploaded document.',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.inGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: TextView(
                              text: 'Upload New Document',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.w),
                            width: 130.w,
                            decoration: BoxDecoration(
                                color: AppColor.greyKind,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: TextView(
                                text:
                                    'The selfie the user took holding their ID.',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.inGrey),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: TextView(
                              text: 'Retake Photo',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                buttonText: 'Submit',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const ReviewInfoScreen()),
                  // );
                }),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
