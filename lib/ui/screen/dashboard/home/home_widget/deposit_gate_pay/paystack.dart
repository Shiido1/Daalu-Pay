import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/app_assets/app_utils.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../app_assets/app_validatiion.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/text_form_widget.dart';
import '../../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class PaystackScreen extends StatefulWidget {
  const PaystackScreen({super.key});

  @override
  State<PaystackScreen> createState() => _PaystackScreenState();
}

class _PaystackScreenState extends State<PaystackScreen> {
  String selected = '';
  List<String> amounts = [
    '1000',
    '5000',
    '10000',
    '15000',
    '20000',
    '25000',
    '50000',
    '100000',
  ];

  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? walletId;
  int dailyLimit = 0;
  int transaction = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await model.getStatistics(context);
            model.getStatsResponseModel!.data!.wallets!.any((e) {
              walletId = e.id.toString();
              return e.currency == 'NGN';
            });
            await model.usersPrefer(context);
            dailyLimit = int.parse(model
                .preferenceResponseModel!.data!.dailyTransactionLimit
                .toString());
            transaction = double.parse(
                    model.preferenceResponseModel!.data!.transactionTotalToday)
                .toInt();
            AppUtils.snackbar(
              context,
              message:
                  'Your limit for today is ${oCcy.format(dailyLimit - transaction)}.',
            );
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Container(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImage.fullPaystack),
                    SizedBox(
                      height: 50.h,
                    ),
                    TextFormWidget(
                      label: 'Enter Amount',
                      hint: 'Amount to Deposit',
                      border: 10,
                      isFilled: true,
                      keyboardType: TextInputType.number,
                      fillColor: AppColor.white,
                      controller: amountController,
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
                                  text: oCcy.format(double.parse(e)),
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
                      height: 100.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Confirm Deposit',
                        color: AppColor.white,
                        border: 8,
                        buttonColor: AppColor.primary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: dailyLimit > transaction
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  model.makePayment(
                                      amount:
                                          double.parse(amountController.text),
                                      walletId: walletId,
                                      context: context);
                                }
                              }
                            : () {
                                AppUtils.snackbar(context,
                                    message:
                                        'You have exceeded your daily limit..',
                                    error: true);
                              }),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
