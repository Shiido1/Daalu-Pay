import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int i = 1;
  List<String> image = [AppImage.currency, AppImage.safe, AppImage.swap];

  Widget mainText(i) {
    if (i == 1) {
      return TextView(
        text: 'Easy Currency Swaps',
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 10, 15, 22),
      );
    } else if (i == 2) {
      return TextView(
        text: 'Safe & Secure',
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 10, 15, 22),
      );
    }
    // ignore: curly_braces_in_flow_control_structures
    return TextView(
      text: 'Save More on Swaps',
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromARGB(255, 10, 15, 22),
    );
  }

  Widget secondaryText(i) {
    if (i == 1) {
      return TextView(
        text: 'Need to swap your Naira?\nWith Daalu Pay, it’s quick and easy.',
        fontSize: 16.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w400,
        color: AppColor.greyKind,
      );
    } else if (i == 2) {
      return TextView(
        text:
            'Rest easy- your money is in good hands.\n Every swap is protected with top security.',
        fontSize: 16.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w400,
        color: AppColor.greyKind,
      );
    }
    // ignore: curly_braces_in_flow_control_structures
    return TextView(
      text:
          'Get great discounts and better rates on every exchange.\n With Daalu Pay, you get more value with\n every transaction.',
      fontSize: 16.sp,
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w400,
      color: AppColor.greyKind,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 70.w, horizontal: 24.w),
        child: Column(
          children: [
            Stack(children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: TextView(
              //     text: 'Skip',
              //     fontSize: 14.sp,
              //     fontWeight: FontWeight.w400,
              //     color: const Color.fromARGB(255, 10, 15, 22),
              //   ),
              // ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: i == 1
                              ? AppColor.primary
                              : AppColor.primary.withOpacity(.2),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      height: 6.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: i == 2
                              ? AppColor.primary
                              : AppColor.primary.withOpacity(.2),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      height: 6.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          color: i == 3
                              ? AppColor.primary
                              : AppColor.primary.withOpacity(.2),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: i == 2 || i == 3 ? 100.h : 160.h,
            ),
            Image.asset(image[i - 1]),
            SizedBox(
              height: 30.h,
            ),
            mainText(i),
            SizedBox(
              height: 20.h,
            ),
            secondaryText(i),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                buttonText: 'Next',
                color: AppColor.white,
                border: 8,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    if (i < 3) {
                      i++;
                    } else {
                      navigate.navigateTo(Routes.createAccountScreen);
                    }
                  });
                }),
            SizedBox(
              height: 10.h,
            ),
            ButtonWidget(
                buttonText: 'Login',
                color: AppColor.darkGrey,
                border: 8,
                buttonColor: AppColor.white,
                buttonBorderColor: AppColor.greyNice,
                onPressed: () {
                  navigate.navigateTo(Routes.loginScreen);
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
