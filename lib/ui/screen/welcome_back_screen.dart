import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import 'kyc/complete_kyc_verification.dart';

// ignore: must_be_immutable
class WelcomeBackScreen extends StatelessWidget {
  WelcomeBackScreen({super.key, required this.name});
  String name;

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
              text: 'Welcome back $name',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text: 'Enter your password to Login',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'Password',
              hint: 'Password',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 140.h,
            ),
            ButtonWidget(
                buttonText: 'Login',
                color: AppColor.grey,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.inGrey,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const CompleteKycVerificationScreen()),
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
