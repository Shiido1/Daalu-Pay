import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../widget/button_widget.dart';
import '../../widget/text_widget.dart';

// ignore: must_be_immutable
class PassportPhotoScreen extends StatefulWidget {
  PassportPhotoScreen({
    super.key,
    required this.docFile,
    required this.docNumber,
    required this.docType,
  });
  String? docType;
  String? docNumber;
  String? docFile;
  @override
  _PassportPhotoScreenState createState() => _PassportPhotoScreenState();
}

class _PassportPhotoScreenState extends State<PassportPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          model.capturePhoto(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => navigate.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.white,
                  )),
              title: TextView(
                text: 'Take Passport Photo',
                color: AppColor.white,
                fontSize: 22.2.sp,
                fontWeight: FontWeight.w600,
              ),
              backgroundColor: AppColor.primary,
            ),
            backgroundColor: AppColor.white,
            body: Center(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  model.passportPhoto != null
                      ? ClipOval(
                          child: Image.file(model.passportPhoto!,
                              width: 250, height: 300, fit: BoxFit.cover),
                        )
                      : Icon(Icons.person, size: 100, color: Colors.grey),
                  SizedBox(height: 50),
                  ButtonWidget(
                      buttonText: 'Next',
                      color: AppColor.white,
                      border: 8,
                      buttonWidth: 300,
                      isLoading:
                          model.postUserVerificationCloudResponse == null ||
                                  model.isLoading
                              ? true
                              : false,
                      buttonColor: AppColor.primary,
                      buttonBorderColor: Colors.transparent,
                      onPressed: model.postUserVerificationCloudResponse == null
                          ? () {}
                          : () {
                              if (model.postUserVerificationCloudResponse !=
                                  null) {
                                model.uploadKyc(context,
                                    kycEntity: KycEntityModel(
                                        documentType: widget.docType,
                                        documentFile: widget.docFile,
                                        documentNumber: widget.docNumber,
                                        passportPhoto:
                                            '${model.postUserVerificationCloudResponse?.publicId}.${model.postUserVerificationCloudResponse?.format}'));
                              }
                            }),
                ],
              ),
            ),
          );
        });
  }
}
