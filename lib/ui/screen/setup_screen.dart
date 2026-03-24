import 'package:daalu_pay/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_assets/app_color.dart';
import '../widget/button_widget.dart';
import '../widget/text_widget.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 32.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: AppColor.white,
                  size: 50.sp,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              TextView(
                text: 'You are all set up !',
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.greyKind,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                text:
                    'We have successfully verified your identity and created your account. Thank you for taking the time out to do that.',
                fontSize: 16.2.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                color: AppColor.greyKind,
              ),
              SizedBox(
                height: 300.h,
              ),
              ButtonWidget(
                  buttonText: 'Continue to your account',
                  color: AppColor.white,
                  border: 8,
                  // isLoading: model.isLoading,
                  buttonColor: AppColor.primary,
                  buttonBorderColor: Colors.transparent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
