import 'package:dotted_border/dotted_border.dart';
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
class AlipaySendMoneyScreen extends StatefulWidget {
  AlipaySendMoneyScreen({super.key, this.wallet});
  String? wallet;

  @override
  State<AlipaySendMoneyScreen> createState() => _AlipaySendMoneyScreenState();
}

class _AlipaySendMoneyScreenState extends State<AlipaySendMoneyScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  dynamic dailyLimit;
  int transaction = 0;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((e) async {
            await model.getStatistics(context);
            await model.usersPrefer(context);
            if (widget.wallet == "CNY") {
              List<Wallet> cnyWallets = model
                  .getStatsResponseModel!.data!.wallets!
                  .where((wallet) => wallet.currency == "CNY")
                  .toList();
              model.currencyController.text = 'CNY';
              if (cnyWallets.isNotEmpty) {
                for (var wallet in cnyWallets) {
                  model.walletHomeAlipay = wallet;
                  model.notifyListeners();
                  print(
                      'print.........${model.walletHomeAlipay?.toJson() ?? ''}');
                }
              } else {
                print("No wallets found for CNY.");
              }
              model.notifyListeners();
            }
            if (model.preferenceResponseModel!.data!.dailyTransactionLimit!
                    .toLowerCase() ==
                'unlimited') {
              dailyLimit = 'unlimited';
              model.dailyLimit = 'unlimited';
            } else {
              dailyLimit = int.parse(model
                  .preferenceResponseModel!.data!.dailyTransactionLimit
                  .toString());
              model.dailyLimit = int.parse(model
                  .preferenceResponseModel!.data!.dailyTransactionLimit
                  .toString());
            }
            transaction = double.parse(
                    model.preferenceResponseModel!.data!.transactionTotalToday)
                .toInt();
            model.transaction = double.parse(
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
                      // suffixWidget: IconButton(
                      //     onPressed: () {
                      //       model.shwWalletCurrencyDialog(context);
                      //       model.notifyListeners();
                      //     },
                      //     icon: Icon(
                      //       Icons.arrow_drop_down_sharp,
                      //       color: AppColor.black,
                      //     )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    model.walletHomeAlipay != null
                        ? TextView(
                            text:
                                ' Balance: ${getAllCurrency(model.walletHomeAlipay?.currency)}${oCcy.format(double.parse('${model.walletHomeAlipay?.balance}'))}',
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
                      controller: model.sendAmountController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Recipient\'s Name',
                      hint: 'Name of Receiver',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      controller: model.nameController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Recipient\'s Email',
                      hint: 'Email Address',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      controller: model.emailController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // model.currencyController.text != 'CNY'
                    //     ? Column(
                    //         children: [
                    //           TextFormWidget(
                    //             hint: 'Payment Details',
                    //             label:
                    //                 'Enter bank details (Account number,\nBank name, Sort Code,\nIBAN, Routing Number etc.)',
                    //             border: 10,
                    //             isFilled: true,
                    //             fillColor: AppColor.white,
                    //             keyboardType: TextInputType.text,
                    //             // controller: model.recipientWalletIdController,
                    //             controller: model.recipientWalletIdController,
                    //           ),
                    //           SizedBox(
                    //             height: 20.h,
                    //           ),
                    //           TextFormWidget(
                    //             hint: 'Payment Details',
                    //             label:
                    //                 'Enter bank details (Account number,\nBank name, Sort Code,\nIBAN, Routing Number etc.)',
                    //             border: 10,
                    //             isFilled: true,
                    //             fillColor: AppColor.white,
                    //             keyboardType: TextInputType.text,
                    //             // controller: model.recipientWalletIdController,
                    //             controller: model.recipientWalletIdController,
                    //           ),
                    //         ],
                    //       )
                    //     : SizedBox.shrink(),
                    SizedBox(
                      height:
                          model.currencyController.text != 'CNY' ? 20.h : 0.h,
                    ),
                    TextFormWidget(
                      hint: 'Description',
                      border: 10,
                      isFilled: true,
                      maxline: 4,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      controller: model.desController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Row(
                        children: <Widget>[
                          model.currencyController.text != 'CNY'
                              ? SizedBox.shrink()
                              : Row(
                                  children: [
                                    Radio(
                                      value: 'wallet',
                                      groupValue: model.radioValue,
                                      onChanged: (v) {
                                        model.radioButtonChanges(v!);
                                      },
                                    ),
                                    Text(
                                      "Wallet Address",
                                    ),
                                  ],
                                ),
                          Spacer(),
                          Radio(
                            value: 'upload',
                            groupValue: model.radioValue,
                            onChanged: (v) {
                              model.radioButtonChanges(v!);
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
                    model.choice == 'wallet'
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
                        : model.choice == 'upload'
                            ? Column(
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
                                            Spacer(),
                                            DottedBorder(
                                                color: AppColor.grey,
                                                strokeWidth: 1,
                                                radius: Radius.circular(22),
                                                padding: EdgeInsets.all(8),
                                                dashPattern: [10, 2],
                                                child: Container(
                                                  width: 158.0.w,
                                                  child: TextView(
                                                    text:
                                                        'The file you are uploading should be clear so admin can confirm approval',
                                                    fontSize: 12.sp,
                                                    maxLines: 4,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.black,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
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
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              )
                            : SizedBox.shrink(),
                    SizedBox(
                      height: 40.h,
                    ),
                    model.walletHomeAlipay != null &&
                            model.walletHomeAlipay!.balance! <= 1
                        ? Column(
                            children: [
                              isTapped
                                  ? Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 26.w, vertical: 20.w),
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormWidget(
                                                label: '',
                                                hint: 'Amount to Convert',
                                                border: 10,
                                                isFilled: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                fillColor: AppColor.white,
                                                onChange: (p0) {
                                                  model.onChangeRate(p0);
                                                },
                                                prefixWidget: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      model
                                                          .modalBottomSheetMenuFrom(
                                                              context);
                                                      // model.notifyListeners();
                                                    },
                                                    child: SvgPicture.asset(
                                                      model.fromCurrency,
                                                    ),
                                                  ),
                                                ),
                                                controller: model
                                                    .fromCurrencylController,
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
                                                keyboardType:
                                                    TextInputType.number,
                                                fillColor: AppColor.white,
                                                onChange: (p0) {
                                                  model.onChangeFromRate(p0);
                                                },
                                                prefixWidget: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      model
                                                          .modalBottomSheetMenuTo(
                                                              context);
                                                      print(
                                                          '${model.exchangeRateResponseModel?.data?.rate}');
                                                    },
                                                    child: SvgPicture.asset(
                                                      model.toCurrency,
                                                    ),
                                                  ),
                                                ),
                                                controller:
                                                    model.toCurrencylController,
                                                // validator: AppValidator.validateEmail(),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                      ],
                                    )
                                  : SizedBox.shrink(),
                              ButtonWidget(
                                  buttonText: 'Add Money',
                                  color: AppColor.white,
                                  border: 8,
                                  buttonColor: AppColor.primary,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () async {
                                    if (isTapped == false) {
                                      setState(() => isTapped = !isTapped);
                                      await model.exchangeRates(context,
                                          from: 'NGN',
                                          to: model.walletHomeAlipay?.currency);
                                      model.toCurrencyCode =
                                          model.walletHomeAlipay?.currency ??
                                              "";

                                      model.toCurrency =
                                          model.getWalletCurrencyCode(
                                              model.walletHomeAlipay?.currency);
                                    } else {
                                      model.showConvertDialog(context);
                                    }
                                  }),
                            ],
                          )
                        : ButtonWidget(
                            buttonText: 'Send Money',
                            color: !model.isLoading
                                ? AppColor.white
                                : AppColor.grey,
                            border: 8,
                            isLoading: model.isLoading,
                            buttonColor: !model.isLoading
                                ? AppColor.primary
                                : AppColor.inGrey,
                            buttonBorderColor: Colors.transparent,
                            onPressed: model.isLoading
                                ? () {}
                                : () {
                                    if (formKey.currentState!.validate() &&
                                        model.walletHomeAlipay != null &&
                                        model.walletHomeAlipay!.balance! >
                                            int.parse(model
                                                .sendAmountController.text)) {
                                      if (dailyLimit == "unlimited") {
                                        model.showSendMoneyDialog(
                                            context,
                                            model.sendAmountController.text,
                                            model.currencyController.text,
                                            wallet: model.walletHomeAlipay);

                                        return;
                                      }
                                      if (dailyLimit > transaction) {
                                        model.showSendMoneyDialog(
                                            context,
                                            model.sendAmountController.text,
                                            model.currencyController.text,
                                            wallet: model.walletHomeAlipay);
                                      } else {
                                        AppUtils.snackbar(context,
                                            message:
                                                'You have exceeded your daily limit..',
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
}
