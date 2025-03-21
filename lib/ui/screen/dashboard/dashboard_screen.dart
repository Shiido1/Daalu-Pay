// ignore_for_file: deprecated_member_use

import 'package:daalu_pay/ui/screen/dashboard/home/home_screen.dart';
import 'package:daalu_pay/ui/screen/dashboard/wallet/alipay_send_money.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_assets/app_color.dart';
import '../../app_assets/app_image.dart';
import '../../widget/text_widget.dart';
import 'transaction/transaction_screen.dart';
import 'wallet/send_money.dart';
import 'wallet/wallet_screen.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({super.key, this.index});
  int? index;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    HomeScreen(),
    SendMoneyScreen(),
    WalletScreen(),
    TransactionScreen(),
    AlipaySendMoneyScreen(
      wallet: 'CNY',
    ),
  ];

  @override
  void initState() {
    _currentIndex = widget.index!;
    super.initState();
  }

  Future<bool> willPopControl() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: TextView(
                    text: 'Do you want to exit the app',
                    textAlign: TextAlign.center,
                    fontSize: 18.0.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.red, // Text Color
                          ),
                          child: TextView(
                            text: 'No',
                            fontSize: 20.sp,
                            color: AppColor.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () => exitApp(),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColor.green, // Text Color
                          ),
                          child: TextView(
                            text: 'Yes',
                            fontSize: 20.sp,
                            color: AppColor.green,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ))) ??
        false;
  }

  exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        body: Center(
          child: _body[_currentIndex],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: AppColor.transparent,
            highlightColor: AppColor.transparent,
          ),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: AppColor.white,
              selectedItemColor: AppColor.primary,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 14.8.sp,
              unselectedFontSize: 14.6.sp,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.home,
                    color:
                        _currentIndex == 0 ? AppColor.primary : AppColor.black,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(top: 5.4.w),
                    child: SvgPicture.asset(
                      AppImage.send,
                      color: _currentIndex == 1
                          ? AppColor.primary
                          : AppColor.black,
                      height: 27.0.h,
                      width: 30.w,
                    ),
                  ),
                  label: 'Send',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.wallet,
                    color:
                        _currentIndex == 2 ? AppColor.primary : AppColor.black,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.trans,
                    color:
                        _currentIndex == 3 ? AppColor.primary : AppColor.black,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'TXNs',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.alipay,
                    color:
                        _currentIndex == 4 ? AppColor.primary : AppColor.black,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Alipay',
                ),
              ]),
        ),
      ),
    );
  }
}
