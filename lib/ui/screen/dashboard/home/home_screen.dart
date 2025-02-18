import 'package:carousel_slider/carousel_slider.dart';
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
            model.getStatistics(context);
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
                                padding: EdgeInsets.all(5.2.w),
                                decoration: const BoxDecoration(
                                  color: AppColor.inGrey,
                                  shape: BoxShape.circle,
                                ),
                                child: TextView(
                                  text: getInitials(
                                          '${model.userResponseModel?.data?.firstName} ${model.userResponseModel?.data?.lastName}')
                                      .toUpperCase(),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                      TextView(
                        text:
                            'Welcome ${model.userResponseModel?.data?.firstName ?? ''}',
                        fontSize: 21.20.sp,
                        fontWeight: FontWeight.w500,
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
                  CarouselSlider(
                    items: [
                      ...model.getStatsResponseModel!.data!.wallets!.map((e) =>
                          paddedWing(
                            value: 12.w,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.primary.withOpacity(.8),
                                  borderRadius: BorderRadius.circular(14)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 2.w),
                                        child: SvgPicture.asset(model
                                            .getWalletCurrencyCode(e.currency)),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextView(
                                        text: '${e.currency}',
                                        color: AppColor.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextView(
                                        text: isTapped
                                            ? '${getAllCurrency(e.currency)}${oCcy.format(e.balance ?? 0)}'
                                            : '*********',
                                        textStyle: TextStyle(
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.white,
                                            letterSpacing: isTapped ? 1 : 3),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.w),
                                        child: GestureDetector(
                                            onTap: () => setState(
                                                () => isTapped = !isTapped),
                                            child: SvgPicture.asset(isTapped
                                                ? AppImage.openEye
                                                : AppImage.eye)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  paddedWing(
                                      value: 30.w,
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
                                                arguments:
                                                    SendMoneyScreenArguments(
                                                        wallet: e)),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ))
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: 1,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 1.0,
                      onPageChanged: (index, _) {
                        model.currentPageWallet = index;
                        model.notifyListeners();
                      },
                    ),
                  ),
                SizedBox(height: 12.h),
                model.getStatsResponseModel == null
                    ? SizedBox.shrink()
                    : model.buildCarouselIndicator(),
                SizedBox(height: 40.h),
                paddedWing(
                  value: 10.w,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: TextView(
                      text: 'Swap Transaction',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
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
                        text: 'Recent Transaction',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGrey,
                      ),
                      TextView(
                        text: 'View All',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.darkGrey,
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
