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
  bool isTapped = false;
  TextEditingController accntNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankDetailType = TextEditingController();

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
                      suffixWidget: IconButton(
                          onPressed: () {
                            model.shwWalletCurrencyDialog(context);
                            model.notifyListeners();
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColor.black,
                            size: 20.sp,
                          )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    model.walletAmount != null || widget.wallet != null
                        ? TextView(
                            text:
                                ' Balance: ${getAllCurrency(model.walletAmount?.currency ?? widget.wallet?.currency)}${oCcy.format(double.parse('${model.walletAmount?.balance ?? widget.wallet?.balance}'))}',
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
                      // validator: AppValidator.validateString(),
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
                    model.currencyController.text != 'CNY'
                        ? Column(
                            children: [
                              TextFormWidget(
                                hint: 'Account number',
                                label: 'Enter Account Number',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                keyboardType: TextInputType.text,
                                controller: accntNumber,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                hint: 'Bank Name',
                                label: 'Enter Bank Name',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                keyboardType: TextInputType.text,
                                controller: bankName,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                label: 'Bank Detail Type',
                                hint: 'Select Bank Detail Type',
                                border: 10,
                                isFilled: true,
                                readOnly: true,
                                fillColor: AppColor.white,
                                suffixWidget: IconButton(
                                    onPressed: () {
                                      model.shwBankDetailTypeDialog(context);
                                      model.notifyListeners();
                                    },
                                    icon: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: AppColor.black,
                                      size: 20.sp,
                                    )),
                              ),
                              SizedBox(
                                height:
                                    model.bankDetailType != null ? 20.h : 0.h,
                              ),
                              model.bankDetailType != null
                                  ? TextFormWidget(
                                      hint: '${model.bankDetailType}',
                                      label: 'Enter ${model.bankDetailType}',
                                      border: 10,
                                      isFilled: true,
                                      fillColor: AppColor.white,
                                      keyboardType: TextInputType.text,
                                      controller: bankDetailType,
                                    )
                                  : SizedBox.shrink(),
                            ],
                          )
                        : SizedBox.shrink(),
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
                      // validator: AppValidator.validateString(),
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
                                    TextView(
                                      text: 'Wallet Address',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.darkGrey,
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
                          TextView(
                            text: 'Upload Image',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.darkGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    model.choice == 'wallet'
                        ? TextFormWidget(
                            label: 'Alipay Id',
                            hint: 'Recipient\'s Alipay Id',
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
                                            SvgPicture.asset(
                                              AppImage.cal,
                                              height: 30.h,
                                              width: 30.w,
                                            ),
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
                    model.walletAmount != null &&
                                model.walletAmount!.balance! <= 1 ||
                            widget.wallet != null &&
                                widget.wallet!.balance! <= 1
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
                              isTapped &&
                                      model.exchangeRateResponseModel == null
                                  ? SizedBox.shrink()
                                  : ButtonWidget(
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
                                              to: model
                                                      .walletAmount?.currency ??
                                                  widget.wallet?.currency);
                                          model.toCurrencyCode =
                                              (model.walletAmount?.currency ??
                                                  widget.wallet?.currency)!;

                                          model.toCurrency =
                                              model.getWalletCurrencyCode(model
                                                      .walletAmount?.currency ??
                                                  widget.wallet?.currency);
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
                                    if (model.currencyController.text !=
                                        'CNY') {
                                      model.recipientWalletIdController.text =
                                          ' {"account_number:"${accntNumber.text}","bank_name:"${bankName.text}","bank_detail_type:"${bankDetailType.text}"}';
                                      model.notifyListeners();
                                    }
                                    if (formKey.currentState!.validate() &&
                                            model.walletAmount != null &&
                                            model.walletAmount!.balance! >
                                                int.parse(model
                                                    .sendAmountController
                                                    .text) ||
                                        widget.wallet != null &&
                                            widget.wallet!.balance! >
                                                int.parse(model
                                                    .sendAmountController
                                                    .text)) {
                                      if (dailyLimit == "unlimited") {
                                        model.showSendMoneyDialog(
                                            context,
                                            model.sendAmountController.text,
                                            model.currencyController.text,
                                            wallet: widget.wallet);

                                        return;
                                      }
                                      if (dailyLimit > transaction) {
                                        model.showSendMoneyDialog(
                                            context,
                                            model.sendAmountController.text,
                                            model.currencyController.text,
                                            wallet: widget.wallet);
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
