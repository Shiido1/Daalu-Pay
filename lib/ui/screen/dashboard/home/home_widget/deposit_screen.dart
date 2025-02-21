import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_gate_pay/alipay.dart';
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/deposit_gate_pay/paypal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../widget/text_widget.dart';
import 'deposit_gate_pay/flutter.dart';
import 'deposit_gate_pay/paystack.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  paddedWing({Widget? child, double? vertical, double? horizontal}) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: vertical!.w, horizontal: horizontal!.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((e) async {
            await model.paymentMethod(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return DefaultTabController(
            length: model.paymentGateResponseModel?.data?.length ?? 0,
            child: Scaffold(
              backgroundColor: AppColor.light,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    paddedWing(
                      vertical: 2,
                      horizontal: 16,
                      child: Row(
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
                            text: 'Deposit',
                            fontSize: 22.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 50.h,
                            width: 50.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.w),
                      color: AppColor.primary.withOpacity(.1),
                      child: TabBar(
                        indicatorColor: AppColor.primary,
                        dividerColor: AppColor.transparent,
                        labelPadding:
                            EdgeInsets.only(right: 60), // Space between tabs
                        indicator: UnderlineTabIndicator(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          borderSide: BorderSide(
                              color: AppColor.primary,
                              width: 3.0), // Indicator height
                          // insets: EdgeInsets.symmetric(
                          //     horizontal: 48), // Indicator width
                        ),
                        isScrollable: true,
                        tabs: [
                          if (model.paymentGateResponseModel != null &&
                              model.paymentGateResponseModel!.data!.isNotEmpty)
                            ...model.paymentGateResponseModel!.data!.map(
                              (e) => TextView(
                                text: e.name ?? '',
                                fontSize: 18.sp,
                                color: AppColor.darkGrey,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    model.paymentGateResponseModel == null
                        ? SpinKitPouringHourGlassRefined(
                            color: AppColor.primary,
                            size: 43.0.sp,
                          )
                        : model.paymentGateResponseModel!.data!.isEmpty
                            ? Center(
                                child: TextView(
                                  text: 'No Deposit Option',
                                  fontSize: 22.sp,
                                ),
                              )
                            : paddedWing(
                                vertical: 10,
                                horizontal: 24,
                                child: SizedBox(
                                  height: 740.h,
                                  child: TabBarView(
                                    children: <Widget>[
                                      if (model.paymentGateResponseModel !=
                                              null ||
                                          model.paymentGateResponseModel!.data!
                                              .isNotEmpty)
                                        ...model.paymentGateResponseModel!.data!
                                            .map((e) {
                                          if (e.name == 'Paystack') {
                                            return PaystackScreen();
                                          }
                                          if (e.name == 'Alipay') {
                                            return AlipayScreen();
                                          }
                                          if (e.name == 'PayPal') {
                                            return PaypalScreen();
                                          }
                                          if (e.name == 'Flutterwave') {
                                            return FlutterScreen();
                                          }
                                          return Container();
                                        })

                                      // if (model.paymentGateResponseModel!.data!
                                      //     .contains('Paystack'))
                                      //   PaystackScreen(),
                                      // if (model.paymentGateResponseModel!.data!
                                      //     .contains('Alipay'))
                                      //   AlipayScreen(),
                                      // if (model.paymentGateResponseModel!.data!
                                      //     .contains('PayPal'))
                                      //   PaypalScreen(),
                                      // if (model.paymentGateResponseModel!.data!
                                      //     .contains('Flutterwave'))
                                      //   FlutterScreen()
                                    ],
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  contContainer({required left, required right}) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: left,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.darkGrey,
              ),
              TextView(
                text: right,
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColor.darkGrey,
              ),
            ],
          ),
          SizedBox(height: 1.2.h),
          Divider(
            color: AppColor.inGrey,
            thickness: 1.sp,
          ),
          SizedBox(height: 1.2.h),
        ],
      );
}
