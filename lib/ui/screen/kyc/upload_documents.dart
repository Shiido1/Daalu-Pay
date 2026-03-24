import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validatiion.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_form_widget.dart';

enum Identity { nationalId, passport, driverslicense, voterscard, other }

// ignore: must_be_immutable
class UploadDocumentsScreen extends StatefulWidget {
  const UploadDocumentsScreen({
    super.key,
  });

  @override
  State<UploadDocumentsScreen> createState() => _UploadDocumentsScreenState();
}

class _UploadDocumentsScreenState extends State<UploadDocumentsScreen> {
  bool tap = false;
  Identity? _identity;
  String? idCardIdentity;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController docNumberController = TextEditingController();

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
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 16.w),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Upload Documents',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text:
                          'Please upload a clear photo of your government-issued ID (e.g., National ID, Passport, or Driver’s License)',
                      fontSize: 17.2.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextView(
                      text: 'Select Id',
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<Identity>(
                              value: Identity.nationalId,
                              groupValue: _identity,
                              activeColor: AppColor.greyKind,
                              onChanged: (Identity? value) {
                                setState(() {
                                  _identity = value;
                                  idCardIdentity = 'national_id';
                                });
                              },
                            ),
                            TextView(
                              text: 'National Id',
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<Identity>(
                              value: Identity.passport,
                              groupValue: _identity,
                              activeColor: AppColor.greyKind,
                              onChanged: (Identity? value) {
                                setState(() {
                                  _identity = value;
                                  idCardIdentity = 'passport';
                                });
                              },
                            ),
                            TextView(
                              text: 'Passport',
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<Identity>(
                              value: Identity.driverslicense,
                              groupValue: _identity,
                              activeColor: AppColor.greyKind,
                              onChanged: (Identity? value) {
                                setState(() {
                                  _identity = value;
                                  idCardIdentity = 'licence';
                                });
                              },
                            ),
                            TextView(
                              text: 'Driver’s License',
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<Identity>(
                              value: Identity.voterscard,
                              groupValue: _identity,
                              activeColor: AppColor.greyKind,
                              onChanged: (Identity? value) {
                                setState(() {
                                  _identity = value;
                                  idCardIdentity = 'voters_card';
                                });
                              },
                            ),
                            TextView(
                              text: 'Voters Card',
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio<Identity>(
                              value: Identity.other,
                              groupValue: _identity,
                              activeColor: AppColor.greyKind,
                              onChanged: (Identity? value) {
                                setState(() {
                                  _identity = value;
                                  idCardIdentity = 'other';
                                });
                              },
                            ),
                            TextView(
                              text: 'Other',
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormWidget(
                      label: 'Document Number',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      keyboardType: TextInputType.text,
                      controller: docNumberController,
                      validator: AppValidator.validateString(),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    TextView(
                      text:
                          'Ensure your document is not expired, and all text is visible and legible.',
                      fontSize: 15.4.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: AppColor.grey,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => model.getDocumentImage(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppImage.cal,
                                height: 30.h,
                                width: 30.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextView(
                                text: 'Upload File',
                                fontSize: 16.4.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.darkGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ), // Row(

                    model.filename != null
                        ? Container(
                            padding: EdgeInsets.all(6.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.inGrey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppImage.pdf),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SizedBox(
                                  width: 230.w,
                                  child: TextView(
                                    text: model.filename!,
                                    fontSize: 14.sp,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.darkGrey,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: 50.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Next',
                        color: AppColor.white,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: AppColor.primary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: model.isLoading == true
                            ? () {}
                            : () {
                                if (formkey.currentState!.validate() &&
                                    model.filename != null) {
                                  navigate.navigateTo(
                                      Routes.passportPhotoScreen,
                                      arguments: PassportPhotoScreenArguments(
                                        docFile:
                                            '${model.postUserVerificationCloudResponse?.publicId}.${model.postUserVerificationCloudResponse?.format}',
                                        docNumber: docNumberController.text,
                                        docType: idCardIdentity,
                                      ));
                                } else {
                                  AppUtils.snackbar(context,
                                      message:
                                          'Kindly fill all necessary fields and Select image.',
                                      error: true);
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
