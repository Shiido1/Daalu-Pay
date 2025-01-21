import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/model/get_transaction_response_model/datum.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});
  paddedWing({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          model.getTransaction(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
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
                      label: 'Transaction ID',
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
                                SizedBox(
                                  width: 4.4.w,
                                ),
                                TextView(
                                  text: model.transStats.capitalize(),
                                  color: AppColor.darkGrey,
                                  fontSize: 17.4.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                PopupMenuButton(
                                  onSelected: (value) {
                                    // your logic
                                  },
                                  color: AppColor.white,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20.sp,
                                  ),
                                  itemBuilder: (BuildContext bc) {
                                    return [
                                      PopupMenuItem(
                                        value: '/all',
                                        onTap: () {
                                          model.transStats = 'all';
                                          model.groupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'All',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/successful',
                                        onTap: () {
                                          model.transStats = 'successful';
                                          model.groupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Successful',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/pending',
                                        onTap: () {
                                          model.transStats = 'pending';
                                          model.groupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Pending',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/failed',
                                        onTap: () {
                                          model.transStats = 'failed';
                                          model.groupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Failed',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ];
                                  },
                                )
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
                              // text: '07/11/24-13/11/24',
                              text: '',
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
                    height: 30.h,
                  ),
                  model.getTransactionResponseModel == null
                      ? SpinKitCircle(
                          color: AppColor.primary,
                          size: 43.0.sp,
                        )
                      : model.getTransactionResponseModel!.data!.isEmpty
                          ? Center(
                              child: TextView(
                                text: 'No Transations',
                                fontSize: 20.sp,
                              ),
                            )
                          : Column(
                              children: [
                                if (model.transactionListData!.isNotEmpty)
                                  ...model.transactionListData!
                                      .map((e) => recentTransWidget(
                                            e: e,
                                          ))
                                else
                                  ...model.getTransactionResponseModel!.data!
                                      .map((e) => recentTransWidget(
                                            e: e,
                                          ))
                              ],
                            )
                ],
              ),
            ),
          );
        });
  }

  recentTransWidget({required Datum e}) => paddedWing(
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
                  SizedBox(
                    width: 180.0.w,
                    child: TextView(
                      text:
                          ' REF ID- ${e.referenceNumber?.toUpperCase() ?? ''}',
                      fontSize: 12.sp,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextView(
                    text: DateFormat('yyyy-MM-dd hh:mm a')
                        .format(DateTime.parse(e.createdAt.toString())),
                    fontSize: 12.sp,
                    color: AppColor.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                    text: e.status?.toLowerCase() == 'completed'
                        ? 'Successful'
                        : e.status!.capitalize(),
                    fontSize: 13.2.sp,
                    fontWeight: FontWeight.w400,
                    color: e.status?.toLowerCase() == 'completed'
                        ? AppColor.green
                        : e.status?.toLowerCase() == 'pending'
                            ? AppColor.grey
                            : AppColor.red,
                  ),
                  // TextView(
                  //   text: '5,000 NGN -> 25 USD',
                  //   color: AppColor.green,
                  //   fontSize: 12.sp,
                  //   fontWeight: FontWeight.w500,
                  // ),
                ],
              )
            ],
          ),
        ),
      );
}
