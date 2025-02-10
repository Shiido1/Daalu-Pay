// ignore_for_file: collection_methods_unrelated_type

import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/contant.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) async {
          await model.exchangeRates(context, from: 'NGN', to: 'USD');
          // ignore: use_build_context_synchronously
          model.getStatistics(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 30.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.homeSwap,
                            // ignore: deprecated_member_use
                            color: AppColor.darkGrey,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          TextView(
                            text: 'Swap',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SvgPicture.asset(AppImage.bell),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColor.yellow,
                      ),
                      TextView(
                        text:
                            ' Service charges may apply when exchanging currencies.',
                        fontSize: 11.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormWidget(
                    label: '',
                    hint: 'Amount to swap',
                    border: 10,
                    isFilled: true,
                    keyboardType: TextInputType.number,
                    fillColor: AppColor.white,
                    onChange: (p0) {
                      model.onChangeRate(p0);
                    },
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        onTap: () {
                          model.modalBottomSheetMenuFrom(context);
                        },
                        child: SvgPicture.asset(
                          model.fromCurrency,
                        ),
                      ),
                    ),
                    controller: model.fromCurrencylController,
                    // validator: AppValidator.validateAmount(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      AppImage.iSwap,
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormWidget(
                    label: '',
                    hint: 'Amount to receive',
                    border: 10,
                    isFilled: true,
                    keyboardType: TextInputType.number,
                    fillColor: AppColor.white,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: GestureDetector(
                        onTap: () {
                          model.modalBottomSheetMenuTo(context);
                        },
                        child: SvgPicture.asset(
                          model.toCurrency,
                        ),
                      ),
                    ),
                    controller: model.toCurrencylController,
                    // validator: AppValidator.validateEmail(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'You will recieve approximately ',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        // width: 160.w,
                        child: TextView(
                            text:
                                '${getAllCurrency(model.toCurrencyCode)}${oCcy.format(double.parse(model.toCurrencylController.text))}',
                            maxLines: 2,
                            textOverflow: TextOverflow.fade,
                            textStyle: TextStyle(
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.black,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.inGrey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Exchange Rate',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              Wrap(children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.2.w),
                                  child: SvgPicture.asset(
                                    AppImage.roSwap,
                                    width: 14.w,
                                    height: 14.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                TextView(
                                  text:
                                      '1 ${model.fromCurrencyCode} = ${model.exchangeRateResponseModel?.data?.rate ?? 0} ${model.toCurrencyCode}',
                                  fontSize: 14.4.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Transfer fees',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              TextView(
                                text: model.transferFee(),
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Processing time',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              TextView(
                                text: '2-5 Minutes',
                                fontSize: 15.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  ButtonWidget(
                      buttonText: 'Proceed',
                      color: AppColor.white,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor: AppColor.primary,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () {
                        model.swap(context,
                            swap: SwapEntiyModel(
                                fromAmount: model.fromCurrencylController.text,
                                toAmount: model.toCurrencylController.text,
                                fromCurrency: model.fromCurrencyCode,
                                toCurrency: model.toCurrencyCode,
                                amount: model.toCurrencylController.text,
                                rate: model
                                    .exchangeRateResponseModel!.data!.rate));
                      }),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
