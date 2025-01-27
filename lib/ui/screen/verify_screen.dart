import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_color.dart';
import '../widget/button_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key, required this.email});
  String? email;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {
          viewModel.timer?.cancel();
        },
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 18.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Verify your email',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text: 'Please enter the OTP sent to',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                    TextView(
                      text: widget.email ?? '',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 6.w),
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 5,
                          obscureText: false,
                          // obscuringCharacter: '',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 5) {
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
                      height: 370.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Verify account',
                        color: AppColor.white,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: AppColor.primary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            model.validateOtp(context,
                                otp: textEditingController.text,
                                email: widget.email);
                          }
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await model.requestOtp(context, email: widget.email);
                        model.startTimer();
                      },
                      child: TextView(
                        text: model.startTimerCount > 1
                            ? 'Request OTP: Expires in ${model.startTimerCount} seconds'
                            : 'Request OTP',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.grey,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
