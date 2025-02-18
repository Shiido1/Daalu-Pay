import 'package:daalu_pay/core/connect_end/model/get_stats_response_model/wallet.dart';
import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_widget.dart';
import '../home/home_widget/deposit_screen.dart';
import '../home/swap/swap_screen.dart';

// ignore: must_be_immutable
class ViewWalletScreen extends StatefulWidget {
  ViewWalletScreen({super.key, required this.wallet});
  Wallet? wallet;

  @override
  State<ViewWalletScreen> createState() => _ViewWalletScreenState();
}

class _ViewWalletScreenState extends State<ViewWalletScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        fireOnViewModelReadyOnce: true,
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((e) {
            model.getUser(context);
            model.getStatistics(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.white.withOpacity(.6),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 45.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  paddedWing(
                    value: 12.w,
                    child: Container(
                      height: 220.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.primary.withOpacity(.5),
                          borderRadius: BorderRadius.circular(14)),
                      child: paddedWing(
                        value: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                TextView(
                                  text:
                                      '${model.userResponseModel?.data?.firstName ?? ""} ${model.userResponseModel?.data?.lastName ?? ""}',
                                  fontSize: 18.6.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextView(
                                  text: 'Available Balance',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                                TextView(
                                  text: isTapped
                                      ? '${getAllCurrency(widget.wallet!.currency)}${oCcy.format(widget.wallet!.balance ?? 0)}'
                                      : '********',
                                  textStyle: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 26.h,
                                ),
                                SizedBox(
                                  width: 178.w,
                                  child: TextView(
                                    text: '${widget.wallet!.uuid}',
                                    fontSize: 12.sp,
                                    textOverflow: TextOverflow.fade,
                                    maxLines: 2,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 12.w, bottom: 30.w),
                              child: GestureDetector(
                                  onTap: () =>
                                      setState(() => isTapped = !isTapped),
                                  child: SvgPicture.asset(isTapped
                                      ? AppImage.openEye
                                      : AppImage.eye)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  paddedWing(
                      value: 10.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sendTransFlowWidget(
                              image: AppImage.iSwap,
                              color: AppColor.white,
                              text: 'Send Money',
                              onTap: () => navigate.navigateTo(
                                  Routes.sendMoneyScreen,
                                  arguments: SendMoneyScreenArguments(
                                      wallet: widget.wallet))),
                          homeTransFlowWidget(
                              image: AppImage.addCard,
                              text: 'Deposit',
                              color: AppColor.white,
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DepositScreen()),
                                  )),
                          homeTransFlowWidget(
                              image: AppImage.homeSwap,
                              text: 'Swap',
                              color: AppColor.white,
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SwapScreen()),
                                  )),
                        ],
                      )),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextView(
                    text: 'Recent Transactions',
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 400.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.isLoading ||
                              model.getStatsResponseModel == null)
                            SizedBox.shrink()
                          else if (model.getStatsResponseModel!.data!
                              .transactions!.isEmpty)
                            TextView(
                              text: 'No Transaction',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            )
                          else if (model.getStatsResponseModel != null &&
                              model.getStatsResponseModel!.data!.transactions!
                                  .isNotEmpty)
                            ...model.getStatsResponseModel!.data!.transactions!
                                .reversed
                                .map((o) => Container(
                                      padding: EdgeInsets.all(10.w),
                                      margin: EdgeInsets.only(bottom: 16.w),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          border: Border.all(
                                              color: AppColor.inGrey),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextView(
                                                text: DateFormat(
                                                        'yyyy-MM-dd hh:mm a')
                                                    .format(DateTime.parse(o
                                                        .createdAt
                                                        .toString())),
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
                                                color: o.status
                                                            ?.toLowerCase() ==
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
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
