import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';

class ChooseCurrencyScreen extends StatelessWidget {
  const ChooseCurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
                  height: 50.h,
                  width: 50.w,
                ),
                TextView(
                  text: 'Choose a currency',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 40.h,
                  width: 30.w,
                ),
              ],
            ),
            Center(
              child: TextView(
                text: 'Select a currency to convert to',
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextFormWidget(
              label: 'Search for a currency',
              labelColor: AppColor.grey,
              hint: null,
              border: 10,
              borderColor: AppColor.transparent,
              isFilled: true,
              fillColor: AppColor.light,
              prefixWidget: Padding(
                padding: EdgeInsets.all(12.w),
                child: SvgPicture.asset(
                  AppImage.search,
                ),
              ),
              // controller: emailController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextView(
                      text: 'Recent',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextView(
                      text: 'All',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextView(
                      text: 'Africa',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextView(
                      text: 'Asia',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.w),
                    margin: EdgeInsets.only(right: 16.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextView(
                      text: 'Europe',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextView(
              text: 'Popular Currencies',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 40.h,
            ),
            countryWidget(
                image: AppImage.china, text: 'China', textAbbs: 'CNY'),
            SizedBox(
              height: 20.h,
            ),
            countryWidget(
                image: AppImage.uk, text: 'United Kingdom', textAbbs: 'GBP'),
            SizedBox(
              height: 20.h,
            ),
            countryWidget(
                image: AppImage.nigeria, text: 'Nigeria', textAbbs: 'NG'),
          ],
        ),
      ),
    );
  }

  countryWidget(
          {required String image,
          required String text,
          required String textAbbs}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              SvgPicture.asset(image),
              SizedBox(
                width: 14.w,
              ),
              TextView(
                text: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          TextView(
            text: textAbbs,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          )
        ],
      );
}
