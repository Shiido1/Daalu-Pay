import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/screen/verify_screen.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: 'Create Account',
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text:
                  'Enter your full name and the email address you’d like to use to create an account.',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'First name',
              hint: 'First name',
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
              label: 'Surname',
              hint: 'Surname',
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
              label: 'Gender',
              hint: 'Gender',
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
              label: 'Enter your email address',
              hint: 'Email address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Enter your phone number',
              fontSize: 16.2.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.darkGrey,
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(children: [
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 12.0.w, horizontal: 4.w),
                decoration: BoxDecoration(
                    color: AppColor.inGreyOut,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.inGrey)),
                child: Row(
                  children: [
                    SvgPicture.asset(AppImage.nineja),
                    SizedBox(
                      width: 2.h,
                    ),
                    TextView(
                      text: '+234',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGrey,
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20.sp,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 3.2.w,
              ),
              Expanded(
                child: TextFormWidget(
                  label: '00 00000 000',
                  // hint: 'First name',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.white,
                  // controller: emailController,
                  // validator: AppValidator.validateEmail(),
                ),
              ),
            ]),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextView(
                  text: 'Have an account? ',
                  fontSize: 16.2.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.darkGrey,
                ),
                GestureDetector(
                  onTap: () => navigate.navigateTo(Routes.loginScreen),
                  child: TextView(
                    text: 'Login here',
                    fontSize: 16.2.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ButtonWidget(
                buttonText: 'Continue',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
