import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/screen/kyc/complete_kyc.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/button_widget.dart';

// ignore: must_be_immutable
class CompleteKycVerificationScreen extends StatelessWidget {
  const CompleteKycVerificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
            ),
            TextView(
              text: 'Complete your KYC\nverification',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text: 'Verify your identity to continue',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.greyKind,
            ),
            SizedBox(
              height: 40.h,
            ),
            TextView(
              text:
                  'To ensure a secure and compliant exchange, we need to verify your identity. This helps prevent fraud and comply with financial regulations.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 220.h,
            ),
            ButtonWidget(
                buttonText: 'Start Verification',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompleteKycScreen()),
                  );
                }),
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: TextView(
                text: 'I’ll do this later',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.greyKind,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
