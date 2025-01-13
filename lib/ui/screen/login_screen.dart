import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/model/login_entity_model.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../core/core_folder/app/app.locator.dart';
import '../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.text = '';
    passwordController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
              child: Form(
                key: formKeyLogin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Login',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text: 'Enter your email address',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'example@gmail.com',
                      hint: 'Email Address',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: emailController,
                      validator: AppValidator.validateEmail(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Password',
                      hint: 'Password',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: passwordController,
                      validator: AppValidator.validateString(),
                      suffixIcon: !model.isTogglePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      obscureText: !model.isTogglePassword,
                      onPasswordToggle: model.isOnTogglePassword,
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    TextView(
                      text: 'Forgot Password',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkGrey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextView(
                          text: 'Don’t have an account? ',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkGrey,
                        ),
                        TextView(
                          text: 'Sign up here',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 240.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Login',
                        color: AppColor.grey,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: AppColor.inGrey,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKeyLogin.currentState!.validate()) {
                            model.loginUser(
                                LoginEntityModel(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                                context);
                          }
                        }),
                    SizedBox(
                      height: 30.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'By registering, you accept our ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyKind,
                            fontSize: 14.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary,
                                  fontSize: 14.sp)),
                          TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyKind,
                                  fontSize: 14.sp)),
                          TextSpan(
                              text: 'Privacy Policy.',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary,
                                  fontSize: 14.sp)),
                          TextSpan(
                              text: ' Your data will be securely encrypted.🔒',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.greyKind,
                                  fontSize: 14.sp)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
