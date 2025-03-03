import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.allExchangeRates(context);
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.w),
              child: Column(
                children: [
                  TextView(
                    text: 'Our Rate',
                    color: AppColor.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.inGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Exchange rates',
                          color: AppColor.greyKind,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.inGrey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              model.allExchangeRatesResponseModel == null ||
                                      model.isLoading
                                  ? SpinKitPouringHourGlassRefined(
                                      color: AppColor.primary,
                                      size: 43.0.sp,
                                    )
                                  : model.allExchangeRatesResponseModel!.data!
                                          .isEmpty
                                      ? Center(
                                          child: TextView(
                                            text: 'No Rates',
                                            fontSize: 22.sp,
                                          ),
                                        )
                                      : Column(
                                          children: [
                                            ...model
                                                .allExchangeRatesResponseModel!
                                                .data!
                                                .reversed
                                                .map((e) =>
                                                    model.exchangeConWidget(
                                                        context, e))
                                          ],
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
                ],
              ),
            );
          }),
    );
  }
}
