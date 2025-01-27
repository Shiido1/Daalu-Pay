import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_color.dart';
import '../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key, required this.email});
  String? email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Forgot Password',
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        label: 'New Password',
                        hint: 'New Password',
                        border: 10,
                        isFilled: true,
                        fillColor: AppColor.white,
                        controller: newPasswordController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        label: 'Confirm New Password',
                        hint: 'Confirm New Password',
                        border: 10,
                        isFilled: true,
                        fillColor: AppColor.white,
                        controller: confirmNewPasswordController,
                        validator: AppValidator.validateString(),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ButtonWidget(
                          buttonText: 'Continue',
                          color: AppColor.white,
                          border: 8,
                          isLoading: model.isLoading,
                          buttonColor: AppColor.primary,
                          buttonBorderColor: Colors.transparent,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              model.resetPassword(context,
                                  reset: ResetPasswordEntity(
                                      email: email,
                                      password: newPasswordController.text,
                                      passwordConfirmation:
                                          confirmNewPasswordController.text));
                            }
                          }),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
