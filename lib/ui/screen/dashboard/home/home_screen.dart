import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/swap/swap_screen.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/contant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.getUser(context);
            await model.getStatistics(context);
            model.walletHome = model.getStatsResponseModel?.data?.wallets![0];
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.0.w),
              child: Column(children: [
                SizedBox(
                  height: 50.h,
                ),
                paddedWing(
                  value: 8.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      model.userResponseModel == null
                          ? SizedBox.shrink()
                          : GestureDetector(
                              onTap: () =>
                                  navigate.navigateTo(Routes.profileScreen),
                              child: Container(
                                padding: EdgeInsets.all(7.2.w),
                                decoration: BoxDecoration(
                                  color: AppColor.inGrey.withOpacity(.22),
                                  border: Border.all(color: AppColor.primary),
                                  shape: BoxShape.circle,
                                ),
                                child: TextView(
                                  text: getInitials(
                                          '${model.userResponseModel?.data?.firstName} ${model.userResponseModel?.data?.lastName}')
                                      .toUpperCase(),
                                  fontSize: 20.sp,
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                      TextView(
                        text:
                            'Welcome ${model.userResponseModel?.data?.firstName ?? ''}',
                        fontSize: 21.20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                      SizedBox(
                        width: 26.70.w,
                      )
                      // SvgPicture.asset(AppImage.bell)
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                if (model.getStatsResponseModel == null || model.isLoading)
                  Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primary.withOpacity(.3)),
                  ),
                if (model.getStatsResponseModel != null &&
                    model.getStatsResponseModel!.data!.wallets!.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(20.0.w),
                    child: Center(
                      child: TextView(
                        text: 'No Wallet',
                        color: AppColor.black,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                if (model.getStatsResponseModel != null)
                  Card(
                    elevation: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.white.withOpacity(.8),
                          gradient: LinearGradient(
                              colors: [
                                AppColor.white,
                                AppColor.light,
                                AppColor.light,
                                AppColor.primary.withOpacity(.32),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          paddedWing(
                            value: 16,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: AppColor.inGrey.withOpacity(.22),
                                border: Border.all(
                                    color: AppColor.primary.withOpacity(.24)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 2.w),
                                    child: SvgPicture.asset(
                                        model.getWalletCurrencyCode(
                                            model.walletHome?.currency)),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  TextView(
                                    text: '${model.walletHome?.currency}',
                                    color: AppColor.primary,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  IconButton(
                                      onPressed: () => model
                                          .modalBottomSheetMenuWallet(context),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColor.primary,
                                        size: 32.sp,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: isTapped
                                    ? '${getAllCurrency(model.walletHome?.currency)}${oCcy.format(model.walletHome?.balance ?? 0)}'
                                    : '**********',
                                textStyle: TextStyle(
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.primary,
                                    letterSpacing: isTapped ? 1 : 3),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: GestureDetector(
                                    onTap: () =>
                                        setState(() => isTapped = !isTapped),
                                    child: SvgPicture.asset(
                                      isTapped
                                          ? AppImage.openEye
                                          : AppImage.eye,
                                      color: AppColor.primary,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          paddedWing(
                              value: 28.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  homePageTransFlowWidget(
                                      image: AppImage.homeSwap,
                                      text: 'Convert',
                                      onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SwapScreen()),
                                          )),
                                  homePageTransFlowWidget(
                                      image: AppImage.addCard,
                                      text: 'Deposit',
                                      onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DepositScreen()),
                                          )),
                                  homePageTransFlowWidget(
                                    image: AppImage.send,
                                    text: 'Send',
                                    onTap: () => navigate.navigateTo(
                                        Routes.sendMoneyScreen,
                                        arguments: SendMoneyScreenArguments(
                                            wallet: model.walletHome)),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          paddedWing(
                            value: 28.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: 'RECENT TRANSACTIONS',
                                  color: AppColor.black,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                InkWell(
                                  onTap: () => navigate.navigateTo(
                                      Routes.dashboard,
                                      arguments: DashboardArguments(index: 3)),
                                  child: TextView(
                                    text: 'View all',
                                    color: AppColor.primary,
                                    fontSize: 16.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),

                //   CarouselSlider(
                //     items: [
                //       ...model.getStatsResponseModel!.data!.wallets!.map((e) =>
                //           paddedWing(
                //             value: 12.w,
                //             child: Container(
                //               width: double.infinity,
                //               decoration: BoxDecoration(
                //                   color: AppColor.primary.withOpacity(.8),
                //                   borderRadius: BorderRadius.circular(14)),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Padding(
                //                         padding: EdgeInsets.only(top: 2.w),
                //                         child: SvgPicture.asset(model
                //                             .getWalletCurrencyCode(e.currency)),
                //                       ),
                //                       SizedBox(
                //                         width: 10.w,
                //                       ),
                //                       TextView(
                //                         text: '${e.currency}',
                //                         color: AppColor.white,
                //                         fontSize: 22.sp,
                //                         fontWeight: FontWeight.w500,
                //                       )
                //                     ],
                //                   ),
                //                   SizedBox(
                //                     height: 2.h,
                //                   ),
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       TextView(
                //                         text: isTapped
                //                             ? '${getAllCurrency(e.currency)}${oCcy.format(e.balance ?? 0)}'
                //                             : '*********',
                //                         textStyle: TextStyle(
                //                             fontSize: 28.sp,
                //                             fontWeight: FontWeight.w400,
                //                             color: AppColor.white,
                //                             letterSpacing: isTapped ? 1 : 3),
                //                       ),
                //                       SizedBox(
                //                         width: 10.w,
                //                       ),
                //                       Padding(
                //                         padding: EdgeInsets.only(left: 12.w),
                //                         child: GestureDetector(
                //                             onTap: () => setState(
                //                                 () => isTapped = !isTapped),
                //                             child: SvgPicture.asset(isTapped
                //                                 ? AppImage.openEye
                //                                 : AppImage.eye)),
                //                       ),
                //                     ],
                //                   ),
                //                   SizedBox(
                //                     height: 2.h,
                //                   ),
                //                   paddedWing(
                //                       value: 28.w,
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           homePageTransFlowWidget(
                //                               image: AppImage.homeSwap,
                //                               text: 'Convert',
                //                               onTap: () => Navigator.push(
                //                                     context,
                //                                     MaterialPageRoute(
                //                                         builder: (context) =>
                //                                             SwapScreen()),
                //                                   )),
                //                           homePageTransFlowWidget(
                //                               image: AppImage.addCard,
                //                               text: 'Deposit',
                //                               onTap: () => Navigator.push(
                //                                     context,
                //                                     MaterialPageRoute(
                //                                         builder: (context) =>
                //                                             const DepositScreen()),
                //                                   )),
                //                           homePageTransFlowWidget(
                //                             image: AppImage.send,
                //                             text: 'Send',
                //                             onTap: () => navigate.navigateTo(
                //                                 Routes.sendMoneyScreen,
                //                                 arguments:
                //                                     SendMoneyScreenArguments(
                //                                         wallet: e)),
                //                           ),
                //                         ],
                //                       )),
                //                 ],
                //               ),
                //             ),
                //           ))
                //     ],

                //     //Slider Container properties
                //     options: CarouselOptions(
                //       height: 180.0,
                //       enlargeCenterPage: true,
                //       autoPlay: false,
                //       aspectRatio: 1,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enableInfiniteScroll: false,
                //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                //       viewportFraction: 1.0,
                //       onPageChanged: (index, _) {
                //         model.currentPageWallet = index;
                //         model.notifyListeners();
                //       },
                //     ),
                //   ),
                // // SizedBox(height: 12.h),
                // model.getStatsResponseModel == null
                //     ? SizedBox.shrink()
                //     : model.buildCarouselIndicator(),
                SizedBox(height: 40.h),
                paddedWing(
                  value: 10.w,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextView(
                      text: 'CONVERT TRANSACTION',
                      fontSize: 17.20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                model.getStatsResponseModel == null
                    ? SpinKitPouringHourGlassRefined(
                        color: AppColor.primary,
                        size: 43.0.sp,
                      )
                    : model.getStatsResponseModel!.data!.swaps!.isEmpty
                        ? Center(
                            child: TextView(
                              text: 'No Transations',
                              fontSize: 22.sp,
                            ),
                          )
                        : Column(
                            children: [
                              ...model
                                  .getStatsResponseModel!.data!.swaps!.reversed
                                  .map((e) => recentSwapTransWidget(
                                        context: context,
                                        e: e,
                                      ))
                            ],
                          ),
                SizedBox(height: 46.h),
                paddedWing(
                  value: 10.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'RECENT TRANSACTION',
                        fontSize: 17.20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey,
                      ),
                      TextView(
                        text: 'View All',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                model.getStatsResponseModel == null
                    ? SpinKitPouringHourGlassRefined(
                        color: AppColor.primary,
                        size: 43.0.sp,
                      )
                    : model.getStatsResponseModel!.data!.transactions!.isEmpty
                        ? Center(
                            child: TextView(
                              text: 'No Transations',
                              fontSize: 20.sp,
                            ),
                          )
                        : Column(
                            children: [
                              ...model.getStatsResponseModel!.data!
                                  .transactions!.reversed
                                  .map((e) => recentTransWidget(
                                        context: context,
                                        e: e,
                                      ))
                            ],
                          )
              ]),
            );
          }),
    );
  }
}
