import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_assets/app_color.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';
import 'choose_currency_screen.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 30.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImage.homeSwap,
                      // ignore: deprecated_member_use
                      color: AppColor.darkGrey,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextView(
                      text: 'Swap',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SvgPicture.asset(AppImage.bell),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColor.yellow,
                ),
                TextView(
                  text:
                      ' Service charges may apply when exchanging currencies.',
                  fontSize: 11.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: '0 NGN',
              hint: 'Amount to swap',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              prefixWidget: Padding(
                padding: EdgeInsets.all(8.w),
                child: SvgPicture.asset(
                  AppImage.round9ja,
                ),
              ),
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: SvgPicture.asset(
                AppImage.iSwap,
                height: 50.h,
                width: 50.w,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormWidget(
              label: '0 GBP',
              hint: 'Amount to receive',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              prefixWidget: Padding(
                padding: EdgeInsets.all(8.w),
                child: SvgPicture.asset(
                  AppImage.uk,
                ),
              ),
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                TextView(
                  text: 'You will receive approximately',
                  fontSize: 15.4.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  width: 2.w,
                ),
                TextView(
                  text: '26 GBP.',
                  fontSize: 15.4.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.inGrey)),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Exchange Rate',
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Wrap(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.w),
                            child: SvgPicture.asset(AppImage.roSwap),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          TextView(
                            text: '1 NGN = 0.0026 GBP',
                            fontSize: 15.4.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Transfer fees',
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TextView(
                          text: '0.00',
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Processing time',
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        TextView(
                          text: '2-5 Minutes',
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                buttonText: 'Proceed',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChooseCurrencyScreen()),
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
