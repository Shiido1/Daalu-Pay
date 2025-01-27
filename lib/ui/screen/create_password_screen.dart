import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

// ignore: must_be_immutable
class CreatePassworsScreen extends StatelessWidget {
  CreatePassworsScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPasswordConfirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) => Scaffold(
              backgroundColor: AppColor.light,
              body: SingleChildScrollView(
                padding:
                    EdgeInsets.symmetric(vertical: 100.w, horizontal: 24.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Create Password',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                          label: '*********',
                          hint: 'Input your old password',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: oldPassword,
                          validator: AppValidator.validateString(),
                          suffixIcon: !model.isToggleNewPassword!
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          onPasswordToggle: model.isOnToggleNewPassword,
                          obscureText: !model.isToggleNewPassword!),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormWidget(
                        label: '*********',
                        hint: 'Input new your password',
                        border: 10,
                        isFilled: true,
                        fillColor: AppColor.white,
                        controller: newPasswordConfirm,
                        onChange: (value) async {
                          await model.validatePassword(newPasswordConfirm.text);
                          if (value.isNotEmpty) {
                            model.isDisable();
                          } else {
                            model.isNotDisable();
                          }
                        },
                        validator: AppValidator.validatePlainPass(),
                        suffixIcon: !model.isToggleNewPassword!
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onPasswordToggle: model.isOnToggleNewPassword,
                        obscureText: !model.isToggleNewPassword!,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextView(
                        text: 'AT LEAST',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGrey,
                      ),
                      SizedBox(
                        height: 12.0.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                                fontSize: 14.6.sp,
                                text: 'must have 8 characters ',
                                color: model.is8characters
                                    ? AppColor.green
                                    : AppColor.red,
                                fontWeight: FontWeight.w300),
                            TextView(
                                fontSize: 14.6.sp,
                                text: 'must have lower and uppercase',
                                color: model.isUpperCase && model.isLowerCase
                                    ? AppColor.green
                                    : AppColor.red,
                                fontWeight: FontWeight.w300),
                            TextView(
                              fontSize: 14.6.sp,
                              text:
                                  'must include number and special characters',
                              color: model.isNumber && model.isSpecialCharacters
                                  ? AppColor.green
                                  : AppColor.red,
                              fontWeight: FontWeight.w300,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 240.h,
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
                              model.updatePassword(context,
                                  update: UpdatePasswordEntity(
                                      oldPassword: oldPassword.text,
                                      newPassword: newPasswordConfirm.text));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ));
  }
}
