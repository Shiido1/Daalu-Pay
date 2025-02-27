import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final ScrollController _scrollController = ScrollController();

  String maskNumber(String number) {
    if (number.length <= 4) {
      return number; // If length is 4 or less, return as is
    }
    return '******${number.substring(number.length - 4)}';
  }

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200, // Adjust the scroll amount as needed
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {});
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200, // Adjust the scroll amount as needed
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (model) async {
          await model.getBankAccount(context);
          model.withdrawHistory(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            // ignore: deprecated_member_use
            backgroundColor: AppColor.light.withOpacity(.99),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  TextView(
                    text: 'Bank Accounts',
                    fontSize: 22.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            model.modalBottomSheetMenuWithdrawFund(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: AppColor.white, width: 1.6),
                            color: AppColor.primary,
                          ),
                          child: TextView(
                            text: 'Withdraw',
                            color: AppColor.white,
                            fontSize: 17.2.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () =>
                            model.modalBottomSheetMenuAddAccount(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border:
                                Border.all(color: AppColor.white, width: 1.6),
                            color: AppColor.primary,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColor.white,
                                size: 26.sp,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              TextView(
                                text: 'Add Bank Account',
                                color: AppColor.white,
                                fontSize: 16.8.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: scrollLeft,
                        icon: Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 30.sp,
                          color: AppColor.grey,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          controller:
                              _scrollController, // Attach the ScrollController
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              if (model.isLoading ||
                                  model.getBankAccountResponseModel == null)
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 112.w),
                                    child: SpinKitCubeGrid(
                                      color: AppColor.primary,
                                    ),
                                  ),
                                )
                              else if (model
                                  .getBankAccountResponseModel!.data!.isEmpty)
                                Center(
                                  child: TextView(
                                    text: 'No Account Added',
                                    color: AppColor.black,
                                    fontSize: 16.8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              else
                                ...model.getBankAccountResponseModel!.data!.map(
                                  (o) => Container(
                                    margin: EdgeInsets.only(right: 10.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.w, vertical: 16.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColor.grey.withOpacity(.2),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text:
                                              'Accnt Name: ${o.accountName ?? ""}',
                                          color: AppColor.black,
                                          fontSize: 16.8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(height: 10.h),
                                        TextView(
                                          text:
                                              'Accnt No: ${maskNumber(o.accountNumber ?? '')}',
                                          color: AppColor.black,
                                          fontSize: 16.8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(height: 10.h),
                                        TextView(
                                          text:
                                              'Bank Name: ${o.bankName ?? ''}',
                                          color: AppColor.black,
                                          fontSize: 16.8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: scrollRight,
                        icon: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 30.sp,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Card(
                    elevation: 0.5,
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight:
                            500, // Ensures the height does not exceed 500
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColor.white.withOpacity(.999)),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Withdrawal History',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 14.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'Date',
                                  fontSize: 16.40.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                TextView(
                                  text: 'Ref',
                                  fontSize: 16.40.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextView(
                                  text: 'Amount',
                                  fontSize: 16.40.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextView(
                                  text: 'Status',
                                  fontSize: 16.40.sp,
                                  color: AppColor.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Divider(color: AppColor.grey, thickness: .5),
                            if (model.isLoading ||
                                model.withdrawalHistoryResponseModel == null)
                              SizedBox.shrink()
                            else if (model
                                .withdrawalHistoryResponseModel!.data!.isEmpty)
                              Center(
                                child: TextView(
                                  text: 'No Withdrawal History',
                                  color: AppColor.black,
                                  fontSize: 16.8.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            else
                              ...model.withdrawalHistoryResponseModel!.data!
                                  .reversed
                                  .map((o) => Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 90,
                                                child: TextView(
                                                  text: DateFormat('dd/MM/yyyy')
                                                      .format(DateTime.parse(o
                                                          .createdAt
                                                          .toString())),
                                                  fontSize: 14.0.sp,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                child: TextView(
                                                  text: o.reference ?? '',
                                                  fontSize: 14.0.sp,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextView(
                                                text:
                                                    '${getCurrency()}${oCcy.format(double.parse(o.amount ?? '0.0'))}',
                                                textStyle: TextStyle(
                                                  fontSize: 14.6.sp,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextView(
                                                text: o.status?.capitalize() ??
                                                    '',
                                                fontSize: 13.20.sp,
                                                color: o.status
                                                            ?.toLowerCase() ==
                                                        'approved'
                                                    ? AppColor.green
                                                    : o.status?.toLowerCase() ==
                                                            'rejected'
                                                        ? AppColor.red
                                                        : AppColor.yellow,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                              color: AppColor.grey,
                                              thickness: .5),
                                        ],
                                      ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
