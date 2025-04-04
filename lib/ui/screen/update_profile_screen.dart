import 'dart:io';

import 'package:daalu_pay/core/connect_end/model/update_user_entity_model.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/app_assets/app_utils.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_validatiion.dart';
import '../app_assets/contant.dart';
import '../widget/button_widget.dart';
import '../widget/text_form_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
          onViewModelReady: (model) async {
            await model.getUser(context);
            emailController.text = model.userResponseModel?.data?.email ?? '';
            firstnameController.text =
                model.userResponseModel?.data?.firstName ?? '';
            lastnameController.text =
                model.userResponseModel?.data?.lastName ?? '';
            genderController.text = model.userResponseModel?.data?.gender ?? '';
            phoneController.text = model.userResponseModel?.data?.phone ?? '';
          },
          onDispose: (viewModel) {
            viewModel.image = File('');
          },
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
                      text: 'Update Profile',
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text:
                          'Enter your full name and the email address you’d like to use to update your account.',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () => model.getAvatarImage(context),
                      child: model.image != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(100), // Makes it round
                              child: Image.file(
                                model.image!,
                                width: 80, // Set width
                                height: 80, // Set height
                                fit: BoxFit
                                    .cover, // Ensures the image covers the area
                              ),
                            )
                          : Column(
                              children: [
                                model.userResponseModel != null &&
                                        model.userResponseModel?.data?.photo !=
                                            null
                                    ? ClipOval(
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(32),
                                          child: Image.network(
                                            'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${model.userResponseModel?.data?.photo}',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: AppColor.greyKind
                                                    .withOpacity(.3),
                                              ),
                                              child: Center(
                                                child: TextView(
                                                  text: '',
                                                  fontSize: 13.2.sp,
                                                  color: AppColor.black,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : model.userResponseModel == null
                                        ? SizedBox.shrink()
                                        : Container(
                                            padding: EdgeInsets.all(12.2.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.black,
                                              border: Border.all(
                                                  color: AppColor.white),
                                              shape: BoxShape.circle,
                                            ),
                                            child: TextView(
                                              text: getInitials(
                                                      '${model.userResponseModel?.data?.firstName ?? ''} ${model.userResponseModel?.data?.lastName ?? ''}')
                                                  .toUpperCase(),
                                              fontSize: 20.sp,
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                              ],
                            ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextView(
                      text: 'Select Image',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                    SizedBox(
                      height: 30.h,
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
                          )),
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
                          controller: phoneController,
                          validator: AppValidator.validatePhone(),
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
                      validator: AppValidator.confirmValidatePassword(
                          passwordController1: passwordController,
                          passwordController2: confirmPasswordController),
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
                          if (formKeyRegister.currentState!.validate() &&
                              model.image != null) {
                            model.updateProfile(
                              context,
                              update: UpdateUserEntityModel(
                                firstName: firstnameController.text.trim(),
                                lastName: lastnameController.text.trim(),
                                email: emailController.text.trim(),
                                phone: phoneController.text.trim(),
                                gender: genderController.text.trim(),
                                photo:
                                    '${model.postUserVerificationCloudResponseAvatar?.publicId}.${model.postUserVerificationCloudResponseAvatar?.format}',
                                dateOfBirth: model.dobController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          } else if (formKeyRegister.currentState!.validate() &&
                              model.image == null) {
                            model.updateProfile(
                              context,
                              update: UpdateUserEntityModel(
                                firstName: firstnameController.text.trim(),
                                lastName: lastnameController.text.trim(),
                                email: emailController.text.trim(),
                                phone: phoneController.text.trim(),
                                gender: genderController.text.trim(),
                                dateOfBirth: model.dobController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          } else {
                            AppUtils.snackbar(context,
                                message:
                                    'Kindly fill all data and select file.',
                                error: true);
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
                      genderController.text = 'Male';
                      gender = 'male';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Male',
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
                      genderController.text = 'Female';
                      gender = 'female';
                      Navigator.of(context).pop();
                    }),
                    child: TextView(
                      text: 'Female',
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
