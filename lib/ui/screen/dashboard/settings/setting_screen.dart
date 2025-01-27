import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/contant.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  paddedWind({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          model.getUser(context);
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: TextView(
                    text: 'Settings',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  )),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      model.userResponseModel == null
                          ? SizedBox.shrink()
                          : Container(
                              padding: EdgeInsets.all(5.2.w),
                              decoration: const BoxDecoration(
                                color: AppColor.inGrey,
                                shape: BoxShape.circle,
                              ),
                              child: TextView(
                                text: getInitials(
                                        '${model.userResponseModel?.data?.firstName} ${model.userResponseModel?.data?.lastName}')
                                    .toUpperCase(),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text:
                                '${model.userResponseModel?.data?.firstName ?? ""} ${model.userResponseModel?.data?.lastName ?? ''}',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: model.userResponseModel?.data?.email ?? '',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextView(
                    text: 'ACCOUNT',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        paddedWind(
                          child: GestureDetector(
                            onTap: () =>
                                navigate.navigateTo(Routes.profileScreen),
                            child: TextView(
                              text: 'Your Profile',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        paddedWind(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Account Verification',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 4.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: model.userResponseModel?.data?.status
                                                ?.toLowerCase() ==
                                            'active'
                                        ? AppColor.green.withOpacity(.8)
                                        : AppColor.grey),
                                child: TextView(
                                  text: model.userResponseModel?.data?.status
                                          ?.capitalize() ??
                                      '',
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: model.userResponseModel?.data?.status
                                              ?.toLowerCase() ==
                                          'active'
                                      ? AppColor.white
                                      : AppColor.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        paddedWind(
                          child: TextView(
                            text: 'Notification',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextView(
                    text: 'FINANCES',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: paddedWind(
                      child: GestureDetector(
                        onTap: () =>
                            navigate.navigateTo(Routes.transactionScreen),
                        child: TextView(
                          text: 'Transaction Limits',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  TextView(
                    text: 'SECURITY',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      border: Border.all(color: AppColor.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        paddedWind(
                          child: GestureDetector(
                            onTap: () => navigate
                                .navigateTo(Routes.createPassworsScreen),
                            child: TextView(
                              text: 'Change Password',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        paddedWind(
                          child: GestureDetector(
                            onTap: () => navigate
                                .navigateTo(Routes.uploadDocumentsScreen),
                            child: TextView(
                              text: 'KYC',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // Divider(
                        //   color: AppColor.grey,
                        //   thickness: .4.sp,
                        // ),
                        // paddedWind(
                        //   child: TextView(
                        //     text: 'Change Pin',
                        //     fontSize: 14.sp,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
