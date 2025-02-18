import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/model/get_stats_response_model/wallet.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/app_utils.dart';
import '../../../app_assets/app_validatiion.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class SendMoneyScreen extends StatefulWidget {
  SendMoneyScreen({super.key, this.wallet});
  Wallet? wallet;

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  dynamic dailyLimit;
  int transaction = 0;

  TextEditingController sendAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((e) async {
            await model.getStatistics(context);
            await model.usersPrefer(context);
            if (widget.wallet?.currency != "NGN") {
              model.currencyController.text = widget.wallet?.currency ?? '';
            }
            if (model.preferenceResponseModel!.data!.dailyTransactionLimit!
                    .toLowerCase() ==
                'unlimited') {
              dailyLimit = 'unlimited';
            } else {
              dailyLimit = int.parse(model
                  .preferenceResponseModel!.data!.dailyTransactionLimit
                  .toString());
            }
            transaction = double.parse(
                    model.preferenceResponseModel!.data!.transactionTotalToday)
                .toInt();
            if (dailyLimit != 'unlimited') {
              AppUtils.snackbar(
                context,
                message:
                    'Your limit for today is ${oCcy.format(dailyLimit - transaction)}.',
              );
            }
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Send Money',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormWidget(
                      label: 'Currency',
                      hint: 'Select Currency',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: model.currencyController,
                      validator: AppValidator.validateString(),
                      suffixWidget: IconButton(
                          onPressed: () =>
                              model.shwWalletCurrencyDialog(context),
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColor.black,
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    model.walletAmount != null
                        ? TextView(
                            text:
                                ' Balance: ${getAllCurrency(model.walletAmount!.currency)}${oCcy.format(double.parse(model.walletAmount!.balance.toString()))}',
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Amount',
                      hint: 'Amount',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.number,
                      controller: sendAmountController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 'wallet',
                            groupValue: _radioValue,
                            onChanged: (v) {
                              radioButtonChanges(v!);
                            },
                          ),
                          Text(
                            "Wallet Address",
                          ),
                          Spacer(),
                          Radio(
                            value: 'upload',
                            groupValue: _radioValue,
                            onChanged: (v) {
                              radioButtonChanges(v!);
                            },
                          ),
                          Text(
                            "Upload Image",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    choice == 'wallet'
                        ? TextFormWidget(
                            label: 'Alipay Wallet Id',
                            hint: 'Recipient\'s Wallet Address',
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.white,
                            controller: model.recipientWalletIdController,
                            validator: AppValidator.validateString(),
                            onChange: (p0) {
                              // model.onGetUserWalletRate(context, p0);
                            })
                        : choice == 'upload'
                            ? Container(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () => model
                                              .getDocumentAlipayImage(context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(AppImage.cal),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              TextView(
                                                text: 'Upload File',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.darkGrey,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ), // Row(

                                    model.filename != null
                                        ? Container(
                                            padding: EdgeInsets.all(6.w),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.inGrey),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(AppImage.pdf),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 230.w,
                                                  child: TextView(
                                                    text: model.filename!,
                                                    fontSize: 14.sp,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.darkGrey,
                                                  ),
                                                ),
                                                const Spacer(),
                                                // Icon(
                                                //   Icons.delete_outline_rounded,
                                                //   color: AppColor.red,
                                                //   size: 26.sp,
                                                // )
                                              ],
                                            ),
                                          )
                                        : SizedBox.shrink(),
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // model.getWalletIdResponseModel != null
                    //     ? TextView(
                    //         text:
                    //             'Recipient: ${model.getWalletIdResponseModel?.data?.user?.firstName} ${model.getWalletIdResponseModel?.data?.user?.lastName}',
                    //         textStyle: TextStyle(
                    //           fontSize: 14.sp,
                    //           fontWeight: FontWeight.w400,
                    //           color: AppColor.grey,
                    //         ),
                    //       )
                    //     : const SizedBox.shrink(),
                    SizedBox(
                      height: 40.h,
                    ),
                    ButtonWidget(
                      buttonText: 'Send Money',
                      color: !model.isLoading ? AppColor.white : AppColor.grey,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor:
                          !model.isLoading ? AppColor.primary : AppColor.inGrey,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            model.walletAmount!.balance! >
                                int.parse(sendAmountController.text)) {
                          if (dailyLimit == "unlimited") {
                            model.sendMoney(context,
                                sendMoney: SendMonetEntityModel(
                                    amount: sendAmountController.text,
                                    documentType: choice == 'wallet'
                                        ? 'alipay_id'
                                        : 'barcode',
                                    recipientAddress: choice == 'wallet'
                                        ? model.recipientWalletIdController.text
                                        : '${model.postUserVerificationCloudResponse?.publicId}.${model.postUserVerificationCloudResponse?.format}',
                                    currency: model.currencyController.text));

                            return;
                          }
                          if (dailyLimit > transaction) {
                            model.sendMoney(context,
                                sendMoney: SendMonetEntityModel(
                                    amount: sendAmountController.text,
                                    documentType: choice == 'wallet'
                                        ? 'alipay_id'
                                        : 'barcode',
                                    recipientAddress: choice == 'wallet'
                                        ? model.recipientWalletIdController.text
                                        : '${model.postUserVerificationCloudResponse?.publicId}.${model.postUserVerificationCloudResponse?.format}',
                                    currency: model.currencyController.text));
                          } else {
                            AppUtils.snackbar(context,
                                message: 'You have exceeded your daily limit..',
                                error: true);
                          }
                        } else {
                          AppUtils.snackbar(context,
                              message:
                                  'Amount should not be greater than current balance in wallet',
                              error: true);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  String? _radioValue; //Initial definition of radio button value
  String? choice = '';

  radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'wallet':
          choice = value;
          break;
        case 'upload':
          choice = value;
          break;
        default:
          choice = "";
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
}
