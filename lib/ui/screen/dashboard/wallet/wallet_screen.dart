import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/screen/dashboard/wallet/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_widget.dart';
import '../home/swap/swap_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  paddedWin({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
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
              onRefresh: model.getStatisticsRefresh,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    paddedWin(
                      child: Center(
                          child: TextView(
                        text: 'Wallet',
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.w500,
                      )),
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
                          GestureDetector(
                            onTap: () => navigate.navigateTo(
                                Routes.viewWalletScreen,
                                arguments:
                                    ViewWalletScreenArguments(wallet: e)),
                            child: Container(
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
                                    child: SvgPicture.asset(model
                                        .getWalletCurrencyCode(e.currency)),
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: TextView(
                                          text: model
                                              .getWalletCountry(e.currency),
                                          textOverflow: TextOverflow.fade,
                                          fontSize: 17.4.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextView(
                                        text:
                                            '${getAllCurrency(e.currency)}${oCcy.format(double.parse(e.balance.toString()))}',
                                        textStyle: TextStyle(
                                          fontSize: 19.8.sp,
                                          color: AppColor.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SwapScreen()),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: AppColor.white, width: 1.6),
                                  color: AppColor.primary,
                                ),
                                child: TextView(
                                  text: 'Convert',
                                  color: AppColor.white,
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WithdrawalScreen()),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: AppColor.primary, width: 1.6),
                                  color: AppColor.white,
                                ),
                                child: TextView(
                                  text: 'Withdraw',
                                  color: AppColor.primary,
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Transaction History',
                              color: AppColor.greyKind,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  navigate.navigateTo(Routes.sendMoneyScreen),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColor.primary,
                                ),
                                child: TextView(
                                  text: 'Send Money',
                                  color: AppColor.white,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
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
                                            fontSize: 16.sp,
                                            maxLines: 1,
                                            textOverflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(
                                          text: DateFormat('yyyy-MM-dd hh:mm a')
                                              .format(DateTime.parse(
                                                  o.createdAt.toString())),
                                          fontSize: 14.4.sp,
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
                                              '${getCurrency()}${oCcy.format(double.parse(o.amount.toString()))}',
                                          textStyle: TextStyle(
                                            color: o.status?.toLowerCase() ==
                                                    'completed'
                                                ? AppColor.green
                                                : o.status?.toLowerCase() ==
                                                        'pending'
                                                    ? AppColor.grey
                                                    : AppColor.red,
                                            fontSize: 15.2.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        TextView(
                                          text: o.status?.toLowerCase() ==
                                                  'completed'
                                              ? 'Successful'
                                              : o.status!.capitalize(),
                                          fontSize: 15.2.sp,
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
