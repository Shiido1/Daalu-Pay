import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/screen/kyc/upload_documents.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';

// ignore: must_be_immutable
class CompleteKycScreen extends StatelessWidget {
  const CompleteKycScreen({
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
            TextView(
              text: 'Complete your KYC',
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.primary,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'Nigeria',
              hint: 'Country',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              suffixIcon: Icons.keyboard_arrow_down_rounded,
              suffixIconColor: AppColor.darkGrey,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'Enter your Home Address',
              hint: 'Home address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              // suffixIcon: Icons.keyboard_arrow_down_rounded,
              // suffixIconColor: AppColor.darkGrey,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormWidget(
                    label: 'Abuja',
                    hint: 'State',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    suffixIcon: Icons.keyboard_arrow_down_rounded,
                    suffixIconColor: AppColor.darkGrey,
                    // controller: emailController,
                    // validator: AppValidator.validateEmail(),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Expanded(
                  child: TextFormWidget(
                    label: 'Enter City',
                    hint: 'City',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    // suffixIcon: Icons.keyboard_arrow_down_rounded,
                    suffixIconColor: AppColor.darkGrey,
                    // controller: emailController,
                    // validator: AppValidator.validateEmail(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'Enter Zipcode',
              hint: 'Zipcode',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              // suffixIcon: Icons.keyboard_arrow_down_rounded,
              // suffixIconColor: AppColor.darkGrey,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'Select a Document Type',
              hint: 'Proof of address type',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              suffixIcon: Icons.keyboard_arrow_down_rounded,
              suffixIconColor: AppColor.darkGrey,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: 'DD/MM/YYYY',
              hint: 'Date of birth',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              suffixIcon: Icons.calendar_month_outlined,
              suffixIconColor: AppColor.darkGrey,
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
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
                        builder: (context) => const UploadDocumentsScreen()),
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
