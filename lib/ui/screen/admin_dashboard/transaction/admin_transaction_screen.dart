import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class AdminTransactionScreen extends StatelessWidget {
  const AdminTransactionScreen({super.key});
  paddedWing({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            paddedWing(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColor.inGrey,
                        size: 20.sp,
                      )),
                  TextView(
                    text: 'Transactions',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.inGrey,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            paddedWing(
              child: TextFormWidget(
                label: 'Search',
                labelColor: AppColor.grey,
                hint: null,
                border: 10,
                borderColor: AppColor.transparent,
                isFilled: true,
                fillColor: AppColor.inGreyOut,
                prefixWidget: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: SvgPicture.asset(
                    AppImage.search,
                  ),
                ),
                // controller: emailController,
                // validator: AppValidator.validateEmail(),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      height: 40.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Approved',
                            color: AppColor.darkGrey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 20.sp,
                                color: AppColor.darkGrey,
                              ))
                        ],
                      )),
                ),
                Expanded(
                  child: Container(
                    height: 40.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey),
                    ),
                    child: Center(
                      child: TextView(
                        text: '07/11/24-13/11/24',
                        color: AppColor.darkGrey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            paddedWing(
              child: TextView(
                text: 'Recent Transaction',
                color: AppColor.greyKind,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ...[1, 2, 3].map((o) => paddedWing(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    margin: EdgeInsets.only(bottom: 16.w),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.inGrey),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Jane',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            TextView(
                              text: 'ID- #81671ABO',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            TextView(
                              text: 'Today, 3:00 PM',
                              fontSize: 14.sp,
                              color: AppColor.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextView(
                              text: '5,000 NGN -> 25 USD',
                              color: AppColor.green,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 20.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 6.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColor.green.withOpacity(.2)),
                              child: TextView(
                                text: 'Approved',
                                fontSize: 14.sp,
                                color: AppColor.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
