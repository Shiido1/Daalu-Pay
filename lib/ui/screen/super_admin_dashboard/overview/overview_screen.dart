import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app_assets/contant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  bool isTapped = false;
  bool? isSwitched;

  paddWing({child}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: child,
      );
  paddWingEx({child}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        child: child,
      );

  List currentManagement = [
    {
      'currency': 'CNY',
      'country': 'China',
      'flag': AppImage.china,
      'status': 'Active',
      'status_value': true,
    },
    {
      'currency': 'NGN',
      'country': 'Nigeria',
      'flag': AppImage.nigeria,
      'status': 'Active',
      'status_value': true,
    },
    {
      'currency': 'GBP',
      'country': 'UK',
      'flag': AppImage.uk,
      'status': 'Active',
      'status_value': true,
    },
    {
      'currency': 'CAD',
      'country': 'Canada',
      'flag': AppImage.canada,
      'status': 'Disabled',
      'status_value': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 36.0.w,
                  height: 50.h,
                ),
                TextView(
                  text: 'Overview',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                SvgPicture.asset(
                  AppImage.person,
                  color: AppColor.primary,
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 26.w, horizontal: 10.w),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(color: AppColor.inGrey),
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      SvgPicture.asset(
                        AppImage.wallet,
                        color: AppColor.grey,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextView(
                        text: 'Wallet',
                        fontSize: 16.sp,
                        color: AppColor.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(14)),
                    child: paddedWing(
                      value: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: 'Available Balance',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.white,
                              ),
                              TextView(
                                text:
                                    isTapped ? 'N9,900,000,000.00' : '********',
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.white,
                              ),
                            ],
                          ),
                          GestureDetector(
                              onTap: () => setState(() => isTapped = !isTapped),
                              child: SvgPicture.asset(
                                  isTapped ? AppImage.openEye : AppImage.eye))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 34.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.inGrey,
                            ),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          children: [
                            TextView(
                              text: 'Deposit',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            SvgPicture.asset(AppImage.arrowDown)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 34.w, vertical: 6.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.inGrey,
                            ),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Row(
                          children: [
                            TextView(
                              text: 'Withdraw',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            SvgPicture.asset(AppImage.arrowUp)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 6.w, bottom: 10.w, right: 54.w, left: 10.w),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(
                    color: AppColor.inGrey,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: '50',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  TextView(
                    text: 'Active Users',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                overviewTransWidget(
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: AppColor.yellow,
                      size: 32.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Pending Transactions'),
                SizedBox(
                  width: 10.w,
                ),
                overviewTransWidget(
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: AppColor.green,
                      size: 32.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Approved Transactions'),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                overviewTransWidget(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: AppColor.red,
                      size: 30.sp,
                    ),
                    text: TextView(
                      text: '500',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    text1: 'Pending Transactions'),
                SizedBox(
                  width: 10.w,
                ),
                overviewTransWidget(
                    icon: SizedBox(
                      width: 200,
                      child: TextView(
                        text: 'EXCHANGE RATE',
                        fontSize: 13.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        color: AppColor.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    text: TextView(
                      text: '1 USD = 1500 NGN ',
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w900,
                    ),
                    text1: 'Updated- 2 mins ago'),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Transaction',
                  color: AppColor.greyKind,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
                TextView(
                  text: 'View All',
                  color: AppColor.grey,
                  fontSize: 13.2.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            ...[1, 2, 3].map((o) => Container(
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
                            text: 'Jane Doe',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: 'ID- #81671ABO',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextView(
                            text: 'Today, 3:00 PM',
                            fontSize: 14.sp,
                            color: AppColor.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextView(
                            text: '5,000 NGN -> 25 USD',
                            color: AppColor.green,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.w),
                            decoration: BoxDecoration(
                                color: AppColor.green.withOpacity(.17),
                                borderRadius: BorderRadius.circular(6)),
                            child: TextView(
                              text: 'Approved',
                              fontSize: 12.4.sp,
                              color: AppColor.deeperGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Currency Management',
              color: AppColor.greyKind,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.inGrey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  paddWing(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
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
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 26.sp,
                              color: AppColor.grey,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  paddWing(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextView(
                          text: 'Currency',
                          color: AppColor.greyKind,
                          fontSize: 16.sp,
                        ),
                        TextView(
                          text: 'Symbol',
                          color: AppColor.greyKind,
                          fontSize: 16.sp,
                        ),
                        TextView(
                          text: 'Status',
                          color: AppColor.greyKind,
                          fontSize: 16.sp,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .4.sp,
                  ),
                  ...currentManagement.map((e) => currencyManWidget(e)),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.inGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Edit exchange rates',
                    color: AppColor.greyKind,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.inGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...[
                          1,
                          2,
                          3,
                        ].map((e) => exchangeConWidget())
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextView(
                    text:
                        'Last Updated at Tuesday, 3 December 2024 08:12 AM(UTC +01:00)',
                    color: AppColor.primary,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  overviewTransWidget(
          {required Widget icon,
          required Widget text,
          required String text1}) =>
      Expanded(
        child: Container(
          padding:
              EdgeInsets.only(top: 10.w, bottom: 10.w, right: 54.w, left: 10.w),
          decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                color: AppColor.inGrey,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                height: 2.4.w,
              ),
              text,
              SizedBox(
                height: 2.4.w,
              ),
              SizedBox(
                width: 380.w,
                child: TextView(
                  text: text1,
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 14.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );

  currencyManWidget(e) => Column(
        children: [
          paddWing(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        SvgPicture.asset(
                          e['flag'],
                          height: 26.0.h,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        SizedBox(
                          width: 60.w,
                          child: TextView(
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            text: e['country'],
                            color: AppColor.greyKind,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                TextView(
                  text: e['currency'],
                  color: AppColor.greyKind,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                  decoration: BoxDecoration(
                      color: e['status'] == 'Active'
                          ? AppColor.green.withOpacity(.17)
                          : AppColor.grey.withOpacity(.17),
                      borderRadius: BorderRadius.circular(6)),
                  child: TextView(
                    text: e['status'],
                    fontSize: e['status'] == 'Active' ? 13.4.sp : 11.4.sp,
                    color: e['status'] == 'Active'
                        ? AppColor.deeperGreen
                        : AppColor.grey,
                    fontWeight: e['status'] == 'Active'
                        ? FontWeight.w600
                        : FontWeight.w900,
                  ),
                ),
                Switch(
                  value: e['status_value'],
                  onChanged: (v) {
                    e['status_value'] = !e['status_value'];
                    e['status'] =
                        e['status_value'] == true ? 'Active' : 'Disabled';
                    setState(() {});
                  },
                  activeTrackColor: e['status_value'] == true
                      ? AppColor.deeperGreen
                      : AppColor.inGrey,
                  activeColor: e['status_value'] == true
                      ? Colors.white
                      : AppColor.inGrey,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          )
        ],
      );

  exchangeConWidget() => Column(
        children: [
          paddWingEx(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'NGN',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: '-',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: 'USD',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    TextView(
                      text: '1,714.31',
                      color: AppColor.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'NGN',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: '-',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: 'USD',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    TextView(
                      text: '0.000595',
                      color: AppColor.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  AppImage.pen,
                  color: AppColor.darkGrey,
                )
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          ),
        ],
      );
}
