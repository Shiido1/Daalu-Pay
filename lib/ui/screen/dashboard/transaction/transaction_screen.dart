import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_swapped_transactions_response_model/datum.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../widget/text_widget.dart';
import '../home/home_widget/trans_receipt_screen.dart';

// ignore: must_be_immutable
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
        onViewModelReady: (model) async {
          await model.getSwapTransaction(context);
          await model.getStatistics(context);
          model.filterDateTime = DateFormat('yyyy-MM-dd')
              .format(DateTime.parse(model.nowFilter.toString()));
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: RefreshIndicator(
              backgroundColor: AppColor.white,
              color: AppColor.primary,
              onRefresh: model.refreshTransaction,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    paddedWing(
                      child: Center(
                          child: TextView(
                        text: 'Transactions',
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 4.4.w,
                                  ),
                                  TextView(
                                    text: model.transStats,
                                    color: AppColor.darkGrey,
                                    fontSize: 20.4.sp,
                                    fontWeight: FontWeight.w500,
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
                                        if (model.getStatsResponseModel != null)
                                          ...model.getStatsResponseModel!.data!
                                              .wallets!
                                              .map(
                                            (e) => PopupMenuItem(
                                              value: '/${e.currency}',
                                              onTap: () {
                                                model.transStats = e.currency!;
                                                model
                                                    .groupSwapTransationByFromCur(
                                                        context);
                                                model.notifyListeners();
                                              },
                                              child: TextView(
                                                text: e.currency!,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
                                      ];
                                    },
                                  )
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextView(
                                    text: model.filterDateTime ?? '',
                                    color: AppColor.darkGrey,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    width: 1.2.w,
                                  ),
                                  IconButton(
                                      onPressed: () =>
                                          model.filterTransDate(context),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        size: 20.sp,
                                      ))
                                ],
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
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    model.getSwappedTransactionsResponseModel == null
                        ? SpinKitCircle(
                            color: AppColor.primary,
                            size: 43.0.sp,
                          )
                        : model.getSwappedTransactionsResponseModel!.data!
                                .isEmpty
                            ? Center(
                                child: TextView(
                                  text: 'No Transations',
                                  fontSize: 20.sp,
                                ),
                              )
                            : Column(
                                children: [
                                  if (model.transactionListData!.isNotEmpty)
                                    ...model.transactionListData!.reversed
                                        .map((e) => recentTransWidget(
                                              context,
                                              e: e,
                                            ))
                                  else
                                    ...model
                                        .getSwappedTransactionsResponseModel!
                                        .data!
                                        .reversed
                                        .map((e) => recentTransWidget(
                                              context,
                                              e: e,
                                            ))
                                ],
                              )
                  ],
                ),
              ),
            ),
          );
        });
  }

  recentTransWidget(context, {required Datum e}) => paddedWing(
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TransReceiptScreen(
                      e: e,
                    )),
          ),
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
                        text: '${e.fromCurrency ?? ''} - ${e.toCurrency ?? ''}',
                        fontSize: 15.2.sp,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: 180.0.w,
                      child: Row(
                        children: [
                          TextView(
                            text:
                                '${oCcy.format(roundToTwoDecimals(double.parse(e.fromAmount!)))} - ',
                            fontSize: 15.2.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: oCcy.format(
                                roundToTwoDecimals(double.parse(e.toAmount!))),
                            fontSize: 15.2.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    TextView(
                      text: DateFormat('yyyy-MM-dd hh:mm a')
                          .format(DateTime.parse(e.createdAt.toString())),
                      fontSize: 14.2.sp,
                      color: AppColor.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: e.status?.toLowerCase() == 'approved'
                          ? 'Successful'
                          : e.status!.capitalize(),
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w400,
                      color: e.status?.toLowerCase() == 'approved'
                          ? AppColor.green
                          : e.status?.toLowerCase() == 'pending'
                              ? AppColor.grey
                              : AppColor.red,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
