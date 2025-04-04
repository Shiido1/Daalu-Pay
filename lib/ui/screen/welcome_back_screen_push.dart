import 'dart:async';
import 'dart:io';

import 'package:daalu_pay/core/bio_authentication.dart/authentication.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.router.dart';
import '../../core/core_folder/manager/shared_preference.dart';
import '../../core/firebase_api.dart';
import '../../firebase_options.dart';
import '../../main.dart';
import '../widget/button_widget.dart';

// ignore: must_be_immutable
class WelcomeBackPushScreen extends StatefulWidget {
  const WelcomeBackPushScreen({
    super.key,
  });

  @override
  State<WelcomeBackPushScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackPushScreen> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";

  bool hasError = false;

  Future<void> initializeFirebase() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await FirebaseApi().initNotification();
    } else {
      await Firebase.initializeApp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () {
            // initializeFirebase();
            return AuthViewModel();
          },
          onViewModelReady: (model) {},
          disposeViewModel: false,
          onDispose: (viewModel) {},
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 22.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      // ignore: unnecessary_null_comparison
                      text: SharedPreferencesService.instance.isLoggedIn ==
                              false
                          ? 'Welcome back ..'
                          : 'Welcome back ${SharedPreferencesService.instance.usersData['user']['firstName']}',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text:
                          SharedPreferencesService.instance.isVerified == false
                              ? 'Create your pin to Login'
                              : 'Enter your pin to Login',
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
                          obscureText: true,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      bool auth =
                                          await Authentication.authentication();
                                      if (auth) {
                                        navigate.navigateTo(Routes.dashboard,
                                            arguments:
                                                DashboardArguments(index: 0));
                                        Future.delayed(Duration(seconds: 4),
                                            () {
                                          navigate.navigateTo(
                                              Routes.notificationScreen);
                                        });
                                      }
                                    },
                                    icon: Icon(
                                      Icons.fingerprint,
                                      color: AppColor.primary,
                                      size: 53.80.sp,
                                    )),
                                SizedBox(
                                  height: 4.h,
                                ),
                                TextView(
                                  text: 'Login using fingerprint',
                                  fontSize: 17.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.black,
                                ),
                              ],
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
                            model.verifyPinPush(context,
                                pin: textEditingController.text);
                          }
                        }),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
