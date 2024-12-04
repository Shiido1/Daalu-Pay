import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widget/button_widget.dart';
import '../onboarding/onboarding_screen.dart';

enum Identity { nationalId, passport, driverslicense, voterscard }

// ignore: must_be_immutable
class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({
    super.key,
  });

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  bool tap = false;
  Identity? _identity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Upload Documents',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text:
                  'Please upload a clear photo of your government-issued ID (e.g., National ID, Passport, or Driver’s License)',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Select Id',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<Identity>(
                      value: Identity.nationalId,
                      groupValue: _identity,
                      activeColor: AppColor.greyKind,
                      onChanged: (Identity? value) {
                        setState(() {
                          _identity = value;
                        });
                      },
                    ),
                    TextView(
                      text: 'National Id',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<Identity>(
                      value: Identity.passport,
                      groupValue: _identity,
                      activeColor: AppColor.greyKind,
                      onChanged: (Identity? value) {
                        setState(() {
                          _identity = value;
                        });
                      },
                    ),
                    TextView(
                      text: 'Password',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<Identity>(
                      value: Identity.driverslicense,
                      groupValue: _identity,
                      activeColor: AppColor.greyKind,
                      onChanged: (Identity? value) {
                        setState(() {
                          _identity = value;
                        });
                      },
                    ),
                    TextView(
                      text: 'Driver’s License',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<Identity>(
                      value: Identity.voterscard,
                      groupValue: _identity,
                      activeColor: AppColor.greyKind,
                      onChanged: (Identity? value) {
                        setState(() {
                          _identity = value;
                        });
                      },
                    ),
                    TextView(
                      text: 'Voters Card',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text:
                  'Ensure your document is not expired, and all text is visible and legible.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImage.camera),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextView(
                      text: 'Take Photo',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImage.cal),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextView(
                      text: 'Upload File',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGrey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.inGrey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppImage.pdf),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextView(
                    text: 'John Driver’s License pdf.',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                  const Spacer(),
                  Icon(
                    Icons.delete_outline_rounded,
                    color: AppColor.red,
                    size: 26.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                buttonText: 'Next',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen()),
                  );
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
