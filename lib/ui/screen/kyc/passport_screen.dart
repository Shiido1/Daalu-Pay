import 'dart:io';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../widget/button_widget.dart';

// ignore: must_be_immutable
class PassportPhotoScreen extends StatefulWidget {
  PassportPhotoScreen(
      {super.key,
      required this.docFile,
      required this.docNumber,
      required this.docType,
      required this.passport});
  String? docType;
  String? docNumber;
  String? docFile;
  String? passport;
  @override
  _PassportPhotoScreenState createState() => _PassportPhotoScreenState();
}

class _PassportPhotoScreenState extends State<PassportPhotoScreen> {
  File? _passportPhoto;

  Future<void> _capturePhoto() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front, // Use front camera
      imageQuality: 85, // Compress image
    );

    if (pickedFile != null) {
      _cropImage(File(pickedFile.path));
    }
  }

  Future<void> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(
          ratioX: 35, ratioY: 45), // Standard passport size ratio (3.5:4.5)
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Passport Photo',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Passport Photo',
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _passportPhoto = File(croppedFile.path);
      });
    }
  }

  @override
  void initState() {
    _capturePhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            appBar: AppBar(title: Text('Take Passport Photo')),
            backgroundColor: AppColor.white,
            body: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  _passportPhoto != null
                      ? ClipOval(
                          child: Image.file(_passportPhoto!,
                              width: 250, height: 300, fit: BoxFit.cover),
                        )
                      : Icon(Icons.person, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
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
                              if (_passportPhoto != null) {
                                model.uploadKyc(context,
                                    kycEntity: KycEntityModel(
                                        documentType: widget.docType,
                                        documentFile: widget.docFile,
                                        documentNumber: widget.docNumber,
                                        passportPhoto: ''));
                              }
                            }),
                ],
              ),
            ),
          );
        });
  }
}
