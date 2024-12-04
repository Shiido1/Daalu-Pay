// ignore_for_file: deprecated_member_use

import 'package:daalu_pay/ui/screen/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_assets/app_color.dart';
import '../../app_assets/app_image.dart';
import '../../widget/text_widget.dart';
import 'transaction/transaction_screen.dart';
import 'wallet/wallet_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    const HomeScreen(),
    const WalletScreen(),
    const TransactionScreen(),
    Container(),
  ];

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
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.home,
                    color:
                        _currentIndex == 0 ? AppColor.primary : AppColor.black,
                  ),
                  label: _currentIndex == 0 ? 'Home' : '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.wallet,
                    color:
                        _currentIndex == 1 ? AppColor.primary : AppColor.black,
                  ),
                  label: _currentIndex == 1 ? 'Wallet' : '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.trans,
                    color:
                        _currentIndex == 2 ? AppColor.primary : AppColor.black,
                  ),
                  label: _currentIndex == 2 ? 'Transaction' : '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.person,
                    color:
                        _currentIndex == 3 ? AppColor.primary : AppColor.black,
                  ),
                  label: _currentIndex == 3 ? 'Settings' : '',
                ),
              ]),
        ),
      ),
    );
  }
}
