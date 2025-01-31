import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../app_assets/app_utils.dart';
import '../../../../../app_assets/app_validatiion.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/text_form_widget.dart';
import '../../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class AlipayScreen extends StatefulWidget {
  const AlipayScreen({super.key});

  @override
  State<AlipayScreen> createState() => _AlipayScreenState();
}

class _AlipayScreenState extends State<AlipayScreen> {
  String selected = '';
  List<String> amounts = [
    '1000',
    '5000',
    '10,000',
    '15,000',
    '20,000',
    '25,000',
    '50,000',
    '100,000',
  ];

  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? walletId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await model.getStatistics(context);
              model.getStatsResponseModel!.data!.wallets!.any((e) {
                walletId = e.id.toString();
                return e.currency == 'CNY';
              });
            });
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImage.fullAlipay),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormWidget(
                      label: 'Enter Amount',
                      hint: 'Amount to Deposit',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      children: [
                        ...amounts.map((e) => GestureDetector(
                              onTap: () {
                                selected = e;
                                amountController.text = e;
                                setState(() {});
                              },
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(12.w, 14.w, 12.w, 14.w),
                                margin:
                                    EdgeInsets.only(right: 10.w, bottom: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: selected == e
                                        ? AppColor.primary
                                        : AppColor.transparent,
                                    border: Border.all(
                                        color: selected == e
                                            ? AppColor.white
                                            : AppColor.textColor)),
                                child: TextView(
                                  text: e,
                                  fontSize: 14.sp,
                                  color: selected == e
                                      ? AppColor.white
                                      : AppColor.darkGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(20.w),
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.grey.withOpacity(.4)),
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            TextView(
                              text: 'Scan QR Code to Pay',
                              fontSize: 18.sp,
                              color: AppColor.darkGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            QrImageView(
                              data: 'https://qrfy.io/r/kvkzs_kXLe',
                              version: QrVersions.auto,
                              size: 240,
                              gapless: false,
                            ),
                            SizedBox(
                              height: 14.20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextView(
                                  text: 'Copy address:',
                                  fontSize: 15.2.sp,
                                  color: AppColor.darkGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(width: 10.h),
                                IconButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text:
                                              'https://qrfy.io/r/kvkzs_kXLe'));
                                      AppUtils.snackbar(context,
                                          message: 'Barcode Address Copied..!');
                                    },
                                    icon: Icon(
                                      Icons.copy,
                                      color: AppColor.black,
                                      size: 24.0.sp,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Upload Receipt',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            GestureDetector(
                              onTap: () => model.getDocumentImage(context),
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.grey),
                                    borderRadius: BorderRadius.circular(6)),
                                child: TextView(text: 'Select file'),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        model.filename != null
                            ? TextView(
                                text: model.filename!,
                                fontSize: 12.sp,
                                fontStyle: FontStyle.italic,
                                color: AppColor.red.withOpacity(.7),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Confirm Deposit',
                        color: AppColor.white,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: AppColor.primary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            model.alipayVerify(context,
                                alipay: AliPayEntityModel(
                                    walletId: walletId,
                                    amount: amountController.text,
                                    receipt: MultipartFile.fromBytes(
                                        model
                                            .formartFileImage(model.image)
                                            .readAsBytesSync(),
                                        filename: model.image!.path
                                            .split("/")
                                            .last)));
                          }
                        }),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
