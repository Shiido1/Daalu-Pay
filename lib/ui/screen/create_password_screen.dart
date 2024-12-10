import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/screen/setup_screen.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

// ignore: must_be_immutable
class CreatePassworsScreen extends StatelessWidget {
  CreatePassworsScreen({super.key});

  List<String> text = [
    '8 characters',
    'An uppercase letter',
    'A Lowercase letter',
    'A special character',
    'A number'
  ];

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
              text: 'Create Password',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: '*********',
              hint: 'Create your password',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              suffixIcon: Icons.visibility,
              suffixIconColor: AppColor.black,

              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: '*********',
              hint: 'Confirm your password',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              suffixIcon: Icons.visibility,
              suffixIconColor: AppColor.black,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextView(
              text: 'AT LEAST',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.darkGrey,
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                ...text.map((e) => Container(
                      margin: EdgeInsets.only(right: 10.w, bottom: 10.w),
                      padding:
                          EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.inGrey),
                          borderRadius: BorderRadius.circular(24)),
                      child: TextView(
                        text: e,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGrey,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 240.h,
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
                        builder: (context) => const SetupScreen()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
