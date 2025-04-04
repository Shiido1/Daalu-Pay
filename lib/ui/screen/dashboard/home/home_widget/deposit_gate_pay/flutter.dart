import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../../app_assets/app_color.dart';
import '../../../../../app_assets/app_utils.dart';
import '../../../../../app_assets/app_validatiion.dart';
import '../../../../../app_assets/contant.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/text_form_widget.dart';
import '../../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class FlutterScreen extends StatefulWidget {
  const FlutterScreen({super.key});

  @override
  State<FlutterScreen> createState() => _FlutterScreenState();
}

class _FlutterScreenState extends State<FlutterScreen> {
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

  dynamic dailyLimit;
  int transaction = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await model.getStatistics(context);
            model.getStatsResponseModel!.data!.wallets!.any((e) {
              walletId = e.id.toString();
              return e.currency == 'NGN';
            });
          });
          await model.usersPrefer(context);
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
                    SvgPicture.asset(AppImage.fullFlutter),
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (dailyLimit == "unlimited") {
                              model.handleFlutterPaymentInitialization(
                                  amount: double.parse(amountController.text),
                                  walletId: walletId,
                                  context: context);
                              return;
                            }
                            if (dailyLimit > transaction) {
                              model.handleFlutterPaymentInitialization(
                                  amount: double.parse(amountController.text),
                                  walletId: walletId,
                                  context: context);
                            } else {
                              AppUtils.snackbar(context,
                                  message:
                                      'You have exceeded your daily limit..',
                                  error: true);
                            }
                          }
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
