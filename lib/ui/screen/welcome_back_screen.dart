import 'dart:async';

import 'package:daalu_pay/core/bio_authentication.dart/authentication.dart';
import 'package:daalu_pay/core/core_folder/app/app.locator.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/model/send_monet_entity_model.dart'
    show SendMonetEntityModel;
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.router.dart';
import '../../core/core_folder/manager/shared_preference.dart';
import '../../main.dart';
import '../widget/button_widget.dart';

// ignore: must_be_immutable
class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen({
    super.key,
    required this.name,
    required this.transaction,
    required this.sendMoney,
  });
  String? name;
  String? transaction;
  SendMonetEntityModel? sendMoney;

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
        fireOnViewModelReadyOnce: true,
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 22.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: widget.transaction == 'login'
                          ? 'Welcome back ${SharedPreferencesService.instance.usersData['user']['firstName']}'
                          : 'Pin verification screen',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text: SharedPreferencesService.instance.isVerified ==
                              false
                          ? 'Create your pin to ${widget.transaction?.capitalize()}'
                          : 'Enter your pin to ${widget.transaction?.capitalize()}',
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 22.w),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: false,
                          // obscuringCharacter: '',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 4) {
                              return "Input proper OTP";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 56,
                            fieldWidth: 54,
                            borderWidth: 1,
                            inactiveColor: AppColor.inGrey,
                            inactiveFillColor: AppColor.white,
                            activeFillColor:
                                hasError ? Colors.orange : Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          textStyle: const TextStyle(fontSize: 20, height: 1.6),
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          keyboardType: TextInputType.number,
                          boxShadows: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              color: Colors.black12,
                              blurRadius: 10,
                            )
                          ],
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        )),
                    SizedBox(
                      height: 30.h,
                    ),
                    SharedPreferencesService.instance.isFirstLogin == false
                        ? SizedBox.shrink()
                        : Center(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                bool auth =
                                    await Authentication.authentication();
                                if (auth) {
                                  if (widget.transaction == 'send money') {
                                    model.sendMoney(context,
                                        sendMoney: widget.sendMoney);
                                  } else {
                                    navigate.navigateTo(Routes.dashboard,
                                        arguments:
                                            DashboardArguments(index: 0));
                                  }
                                }
                              },
                              icon: Icon(
                                Icons.fingerprint,
                                color: AppColor.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              label: TextView(
                                text: 'Authenticate',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 340.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Enter',
                        color:
                            !model.isLoading ? AppColor.white : AppColor.grey,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: !model.isLoading
                            ? AppColor.primary
                            : AppColor.inGrey,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            SharedPreferencesService.instance.isVerified ==
                                    false
                                ? model.createPin(
                                    contxt: context,
                                    pin: textEditingController.text)
                                : model.verifyPin(context,
                                    transaction: widget.transaction,
                                    pin: textEditingController.text,
                                    send: widget.sendMoney);
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
