import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/model/register_entity_model.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_validatiion.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController genderController = TextEditingController();
  TextEditingController documentController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController zipCodeController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  String? gender;
  String? document;

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
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 24.w),
              child: Form(
                key: formKeyRegister,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Create Account',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text:
                          'Enter your full name and the email address you’d like to use to create an account.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'First name',
                      hint: 'Firstname',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: firstnameController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Last name',
                      hint: 'Lastname',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: lastnameController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Gender',
                      hint: 'Select Gender',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: genderController,
                      validator: AppValidator.validateString(),
                      suffixWidget: IconButton(
                          onPressed: () => shwGenderDialog(),
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColor.black,
                            size: 20.sp,
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Select your date of birth',
                      hint: 'D.O.B',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: model.dobController,
                      validator: AppValidator.validateString(),
                      suffixWidget: IconButton(
                          onPressed: () => model.selectDateOfBirth(context),
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColor.black,
                            size: 20.sp,
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Select Country',
                      hint: 'Country',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: model.signUpCountryController,
                      validator: AppValidator.validateString(),
                      suffixWidget: IconButton(
                          onPressed: () =>
                              model.modalBottomSheetMenuSignUpCountry(context),
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: AppColor.black,
                            size: 20.sp,
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Enter your address',
                      hint: 'Address',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: addressController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Enter your city',
                      hint: 'City',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: cityController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Enter your email address',
                      hint: 'Email address',
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
                      label: 'Zip Code',
                      hint: 'Enter zip code',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: zipCodeController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextView(
                      text: 'Enter your phone number',
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGrey,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0.w, horizontal: 4.w),
                        decoration: BoxDecoration(
                            color: AppColor.inGreyOut,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.inGrey)),
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImage.nineja),
                            SizedBox(
                              width: 2.h,
                            ),
                            TextView(
                              text: '+234',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.darkGrey,
                            ),
                            SizedBox(
                              width: 2.h,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 20.sp,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.2.w,
                      ),
                      Expanded(
                        child: TextFormWidget(
                          label: '00 00000 000',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: AppValidator.validateString(),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Enter your password',
                      hint: 'Password',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: passwordController,
                      suffixIcon: !model.isSignupTogglePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      obscureText: !model.isSignupTogglePassword,
                      onPasswordToggle: model.isSignupOnTogglePassword,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormWidget(
                      label: 'Confirm Password',
                      hint: 'Confirm Password',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: confirmPasswordController,
                      suffixIcon: !model.isSignupConTogglePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      obscureText: !model.isSignupConTogglePassword,
                      onPasswordToggle: model.isSignupConOnTogglePassword,
                      validator: AppValidator.confirmValidatePassword(
                          passwordController1: passwordController,
                          passwordController2: confirmPasswordController),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextView(
                          text: 'Have an account? ',
                          fontSize: 16.2.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkGrey,
                        ),
                        GestureDetector(
                          onTap: () => navigate.navigateTo(Routes.loginScreen),
                          child: TextView(
                            text: 'Login here',
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Continue',
                        color:
                            !model.isLoading ? AppColor.white : AppColor.grey,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: !model.isLoading
                            ? AppColor.primary
                            : AppColor.inGrey,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKeyRegister.currentState!.validate()) {
                            model.register(
                                RegisterEntityModel(
                                  firstName: firstnameController.text.trim(),
                                  lastName: lastnameController.text.trim(),
                                  email: emailController.text.trim(),
                                  phoneNumber: phoneController.text.trim(),
                                  gender: genderController.text.trim(),
                                  address: addressController.text.trim(),
                                  city: cityController.text.trim(),
                                  dateOfBirth: model.dobController.text.trim(),
                                  zipCode: zipCodeController.text.trim(),
                                  country:
                                      model.signUpCountryController.text.trim(),
                                  password: passwordController.text.trim(),
                                  confirmPassword:
                                      confirmPasswordController.text.trim(),
                                ),
                                context);
                          }
                        }),
                  ],
                ),
              ),
            );
          }),
    );
  }

  shwGenderDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextView(
              text: 'Gender',
              color: AppColor.black,
              textAlign: TextAlign.center,
              fontSize: 22.2.sp,
            ),
            titleTextStyle: TextStyle(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      genderController.text = 'Male';
                      gender = 'male';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Male',
                      color: AppColor.black,
                      fontSize: 20.2.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Divider(thickness: .3),
                  GestureDetector(
                    onTap: () => setState(() {
                      genderController.text = 'Female';
                      gender = 'female';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Female',
                      color: AppColor.black,
                      fontSize: 20.2.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
          );
        },
      );

  shwDocumentDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextView(
              text: 'Select Document',
              color: AppColor.black,
              textAlign: TextAlign.center,
              fontSize: 19.2.sp,
            ),
            titleTextStyle: TextStyle(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      documentController.text = 'Driver\'s Licence';
                      document = 'licence';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Driver\'s Licence',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Divider(thickness: .3),
                  GestureDetector(
                    onTap: () => setState(() {
                      documentController.text = 'National ID';
                      document = 'national';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'National ID',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Divider(thickness: .3),
                  GestureDetector(
                    onTap: () => setState(() {
                      documentController.text = 'International Passport';
                      document = 'passport';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'International Passport',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Divider(thickness: .3),
                  GestureDetector(
                    onTap: () => setState(() {
                      documentController.text = 'Other';
                      document = 'other';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Other',
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
          );
        },
      );
}
