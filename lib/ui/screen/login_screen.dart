import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import 'admin_dashboard/admin_dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              text: 'Login',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text: 'Enter your email address',
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'example@gmail.com',
              hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
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
              height: 14.0.h,
            ),
            TextView(
              text: 'Forgot Password',
              fontSize: 16.2.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGrey,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextView(
                  text: 'Don’t have an account? ',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGrey,
                ),
                TextView(
                  text: 'Sign up here',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary,
                ),
              ],
            ),
            SizedBox(
              height: 240.h,
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
                        builder: (context) => const AdminDashboard()),
                  );
                }),
            SizedBox(
              height: 30.h,
            ),
            RichText(
              text: TextSpan(
                text: 'By registering, you accept our ',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColor.greyKind,
                    fontSize: 14.sp),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.primary,
                          fontSize: 14.sp)),
                  TextSpan(
                      text: ' and ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyKind,
                          fontSize: 14.sp)),
                  TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.primary,
                          fontSize: 14.sp)),
                  TextSpan(
                      text: ' Your data will be securely encrypted.🔒',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColor.greyKind,
                          fontSize: 14.sp)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
