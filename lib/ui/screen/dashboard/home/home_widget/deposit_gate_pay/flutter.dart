import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../app_assets/app_color.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/text_form_widget.dart';
import '../../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class FlutterScreen extends StatefulWidget {
  const FlutterScreen({super.key});

  @override
  State<FlutterScreen> createState() => _FlutterScreenState();
}

class _FlutterScreenState extends State<FlutterScreen> {
  String selected = '';
  List<String> amounts = [
    '1000',
    '5000',
    '10,000',
    '15,000',
    '20,000',
    '25,000',
    '50,000',
    '100,000',
  ];

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImage.fullFlutter),
            SizedBox(
              height: 50.h,
            ),
            TextFormWidget(
              label: 'Enter Amount',
              hint: 'Amount to Deposit',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: amountController,
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                ...amounts.map((e) => GestureDetector(
                      onTap: () {
                        selected = e;
                        amountController.text = e;
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12.w, 14.w, 12.w, 14.w),
                        margin: EdgeInsets.only(right: 10.w, bottom: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selected == e
                                ? AppColor.primary
                                : AppColor.transparent,
                            border: Border.all(
                                color: selected == e
                                    ? AppColor.white
                                    : AppColor.textColor)),
                        child: TextView(
                          text: e,
                          fontSize: 14.sp,
                          color: selected == e
                              ? AppColor.white
                              : AppColor.darkGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            ButtonWidget(
                buttonText: 'Confirm Deposit',
                color: AppColor.white,
                border: 8,
                // isLoading: model.isLoading,
                buttonColor: AppColor.primary,
                buttonBorderColor: Colors.transparent,
                onPressed: () {}),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
