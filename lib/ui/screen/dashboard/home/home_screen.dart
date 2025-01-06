import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/receipt_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/swap/swap_screen.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_stats_response_model/transaction.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
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
          onViewModelReady: (model) {
            model.getUser(context);
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
                      Container(
                        padding: EdgeInsets.all(5.2.w),
                        decoration: const BoxDecoration(
                          color: AppColor.inGrey,
                          shape: BoxShape.circle,
                        ),
                        child: TextView(
                          text: getInitials(
                              '${model.userResponseModel?.data?.firstName} ${model.userResponseModel?.data?.lastName}'),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextView(
                        text:
                            'Welcome ${model.userResponseModel?.data?.firstName ?? ''}',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset(AppImage.bell)
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                paddedWing(
                    value: 12.w,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
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
                                  text: isTapped
                                      ? '${getCurrency()}${oCcy.format(model.userResponseModel?.data?.wallets?[0].balance ?? 0)}'
                                      : '********',
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () =>
                                    setState(() => isTapped = !isTapped),
                                child: SvgPicture.asset(
                                    isTapped ? AppImage.openEye : AppImage.eye))
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: 40.h),
                paddedWing(
                    value: 10.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homeTransFlowWidget(
                            image: AppImage.homeSwap,
                            text: 'Swap',
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SwapScreen()),
                                )),
                        homeTransFlowWidget(
                            image: AppImage.addCard,
                            text: 'Deposit',
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DepositScreen()),
                                )),
                        homeTransFlowWidget(
                            image: AppImage.homeHelp,
                            text: 'Get Help',
                            onTap: () {}),
                      ],
                    )),
                SizedBox(height: 46.h),
                paddedWing(
                  value: 10.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Recent Transaction',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGrey,
                      ),
                      TextView(
                        text: 'View All',
                        fontSize: 12.sp,
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
                    ? SpinKitCircle(
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
                              ...model
                                  .getStatsResponseModel!.data!.transactions!
                                  .map((e) => recentTransWidget(
                                        e: e,
                                        // text: 'Deposit',
                                        // textValue: e == 1
                                        //     ? 'Successful'
                                        //     : e == 2
                                        //         ? 'Pending'
                                        //         : 'Failed',
                                        // time: 'Today, 3:00 PM',
                                        // amount: '5,000 NGN -> 25 USD'
                                      ))
                            ],
                          )
              ]),
            );
          }),
    );
  }

  homeTransFlowWidget(
          {required String image,
          required String text,
          required Function() onTap}) =>
      Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(14.2.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.primary.withOpacity(.3))),
              child: SvgPicture.asset(image),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextView(
            text: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.darkGrey,
          )
        ],
      );

  recentTransWidget({required Transaction e}) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReceiptScreen()),
        ),
        child: Container(
          padding: EdgeInsets.all(10.w),
          margin: EdgeInsets.only(bottom: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.inGrey),
            borderRadius: BorderRadius.circular(12),
            color: AppColor.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: "Deposit",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                  TextView(
                    text: DateFormat('yyyy-MM-dd hh:mm a')
                        .format(DateTime.parse(e.createdAt.toString())),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColor.darkGrey,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                    text: e.status ?? '',
                    fontSize: 13.2.sp,
                    fontWeight: FontWeight.w400,
                    color: e == 1
                        ? AppColor.green
                        : e == 2
                            ? AppColor.grey
                            : AppColor.red,
                  ),
                  TextView(
                    text:
                        '${getCurrency()}${oCcy.format(double.parse(e.amount!))}',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGrey,
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
