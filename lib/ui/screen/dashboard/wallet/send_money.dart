import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_utils.dart';
import '../../../app_assets/app_validatiion.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class SendMoneyScreen extends StatefulWidget {
  SendMoneyScreen({super.key, this.currency});
  String? currency;

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController sendAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((e) async {
            await model.getStatistics(context);
            if (widget.currency != null) {
              model.currencyController.text = widget.currency!;
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
                    TextFormWidget(
                        label: 'UUID',
                        hint: 'Recipient\'s Wallet Address',
                        border: 10,
                        isFilled: true,
                        fillColor: AppColor.white,
                        controller: model.recipientWalletIdController,
                        validator: AppValidator.validateString(),
                        onChange: (p0) {
                          model.onGetUserWalletRate(context, p0);
                        }),
                    SizedBox(
                      height: 10.h,
                    ),
                    model.getWalletIdResponseModel != null
                        ? TextView(
                            text:
                                'Recipient: ${model.getWalletIdResponseModel?.data?.user?.firstName} ${model.getWalletIdResponseModel?.data?.user?.lastName}',
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          )
                        : const SizedBox.shrink(),
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
                          model.sendMoney(context,
                              sendMoney: SendMonetEntityModel(
                                  amount: sendAmountController.text,
                                  recipientAddress:
                                      model.recipientWalletIdController.text,
                                  currency: model.currencyController.text));
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
}
