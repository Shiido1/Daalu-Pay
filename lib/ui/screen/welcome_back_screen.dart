import 'dart:async';

import 'package:daalu_pay/core/core_folder/app/app.locator.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/model/swap_entiy_model.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../widget/button_widget.dart';

// ignore: must_be_immutable
class WelcomeBackScreen extends StatefulWidget {
  WelcomeBackScreen(
      {super.key,
      required this.name,
      required this.transaction,
      required this.swap});
  String? name;
  String? transaction;
  SwapEntiyModel? swap;

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
                text: widget.transaction == 'login'
                    ? 'Welcome back ${widget.name}'
                    : 'Pin verification screen',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.primary,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                text: 'Enter your pin to ${widget.transaction?.capitalize()}',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.grey,
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.w, horizontal: 22.w),
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
                      activeFillColor: hasError ? Colors.orange : Colors.white,
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
                height: 340.h,
              ),
              ViewModelBuilder<AuthViewModel>.reactive(
                  viewModelBuilder: () => locator<AuthViewModel>(),
                  onViewModelReady: (model) {},
                  fireOnViewModelReadyOnce: true,
                  disposeViewModel: false,
                  onDispose: (viewModel) {},
                  builder: (_, AuthViewModel model, __) {
                    return ButtonWidget(
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
                            model.verifyPin(context,
                                transaction: widget.transaction,
                                pin: textEditingController.text,
                                swap: widget.swap);
                          }
                        });
                  }),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
