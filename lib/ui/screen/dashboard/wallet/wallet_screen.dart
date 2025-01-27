import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (model) {
          WidgetsBinding.instance
              .addPostFrameCallback((e) => model.getStatistics(context));
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: RefreshIndicator(
              backgroundColor: AppColor.white,
              color: AppColor.primary,
              onRefresh: () => model.getStatistics(context),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Row(
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
                          text: 'Wallet',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: 30.w,
                        )
                        // Container(
                        //   padding: EdgeInsets.all(16.w),
                        //   decoration: const BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     color: AppColor.inGrey,
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 34.0.w,
                          ),
                          IconButton(
                              onPressed: () => model
                                  .modalBottomSheetMenuCreateWallet(context),
                              icon: Icon(
                                Icons.add,
                                size: 30.sp,
                                color: AppColor.primary,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    if (model.isLoading || model.getStatsResponseModel == null)
                      Center(
                        child: SpinKitCubeGrid(
                          color: AppColor.primary,
                        ),
                      )
                    else if (model
                        .getStatsResponseModel!.data!.wallets!.isEmpty)
                      TextView(
                        text: 'No Wallet',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      )
                    else if (model.getStatsResponseModel != null &&
                        model.getStatsResponseModel!.data!.wallets!.isNotEmpty)
                      ...model.getStatsResponseModel!.data!.wallets!.map((e) =>
                          Container(
                            padding: EdgeInsets.all(10.w),
                            margin: EdgeInsets.only(bottom: 16.w),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                border: Border.all(color: AppColor.inGrey),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2.w),
                                  child: SvgPicture.asset(
                                      model.getWalletCurrencyCode(e.currency)),
                                ),
                                SizedBox(
                                  width: 14.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: model.getWalletCountry(e.currency),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    TextView(
                                      text:
                                          '${getAllCurrency(e.currency)}${oCcy.format(double.parse(e.balance.toString()))}',
                                      textStyle: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColor.grey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Transaction History',
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
                    if (model.isLoading || model.getStatsResponseModel == null)
                      SizedBox.shrink()
                    else if (model
                        .getStatsResponseModel!.data!.transactions!.isEmpty)
                      TextView(
                        text: 'No Transaction',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      )
                    else if (model.getStatsResponseModel != null &&
                        model.getStatsResponseModel!.data!.transactions!
                            .isNotEmpty)
                      ...model.getStatsResponseModel!.data!.transactions!
                          .map((o) => Container(
                                padding: EdgeInsets.all(10.w),
                                margin: EdgeInsets.only(bottom: 16.w),
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    border: Border.all(color: AppColor.inGrey),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 160.w,
                                          child: TextView(
                                            text:
                                                'Ref No-: ${o.referenceNumber?.toUpperCase()}',
                                            fontSize: 12.sp,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(
                                          text: DateFormat('yyyy-MM-dd hh:mm a')
                                              .format(DateTime.parse(
                                                  o.createdAt.toString())),
                                          fontSize: 12.sp,
                                          color: AppColor.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextView(
                                          text:
                                              '${getCurrency()}${oCcy.format(double.parse(o.amount!))}',
                                          textStyle: TextStyle(
                                            color: AppColor.greyNice,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(
                                          text: o.status?.toLowerCase() ==
                                                  'completed'
                                              ? 'Successful'
                                              : o.status!.capitalize(),
                                          fontSize: 13.2.sp,
                                          fontWeight: FontWeight.w400,
                                          color: o.status?.toLowerCase() ==
                                                  'completed'
                                              ? AppColor.green
                                              : o.status?.toLowerCase() ==
                                                      'pending'
                                                  ? AppColor.grey
                                                  : AppColor.red,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}