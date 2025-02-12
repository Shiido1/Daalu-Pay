import 'dart:io';

import 'package:daalu_pay/core/connect_end/model/notification_user_entity_model.dart';
import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/manager/shared_preference.dart';
import '../../../app_assets/contant.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  paddedWind({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) async {
          await model.getUser(context);
          model.initNotificationToken();
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: AppColor.primary.withOpacity(.5),
                                  size: 19.2.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Your Profile',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.verified_outlined,
                                    color: AppColor.primary.withOpacity(.5),
                                    size: 19.2.sp,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  TextView(
                                    text: 'Verification',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
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
                        SizedBox(
                          height: 1.32.h,
                        ),
                        paddedWind(
                          child: GestureDetector(
                            onTap: () => navigate.navigateTo(Routes.chatScreen),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.message,
                                  color: AppColor.primary.withOpacity(.5),
                                  size: 19.2.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Live Chat',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.32.h,
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        paddedWind(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.notifications_none,
                                    color: AppColor.primary.withOpacity(.5),
                                    size: 19.2.sp,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  TextView(
                                    text: 'Notification',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              Switch(
                                value: SharedPreferencesService
                                    .instance.isNotified,
                                onChanged: (v) {
                                  if (SharedPreferencesService
                                          .instance.isNotified ==
                                      true) {
                                    SharedPreferencesService
                                        .instance.isNotified = false;
                                    model.deleteNotificationToken(context,
                                        id: globalfCMToken);
                                  } else {
                                    SharedPreferencesService
                                        .instance.isNotified = true;
                                    model.updateNotificationToken(context,
                                        notificationUser:
                                            NotificationUserEntityModel(
                                                token: globalfCMToken,
                                                deviceType: Platform.isIOS
                                                    ? 'ios'
                                                    : 'android'));
                                  }
                                  setState(() {});
                                  ();
                                },
                                activeTrackColor: SharedPreferencesService
                                            .instance.isNotified ==
                                        true
                                    ? AppColor.deeperGreen
                                    : AppColor.inGrey,
                                activeColor: SharedPreferencesService
                                            .instance.isNotified ==
                                        true
                                    ? Colors.white
                                    : AppColor.inGrey,
                              ),
                            ],
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.monetization_on_outlined,
                              color: AppColor.primary.withOpacity(.5),
                              size: 19.2.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            TextView(
                              text: 'Transaction Limit',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.password_outlined,
                                  color: AppColor.primary.withOpacity(.5),
                                  size: 19.2.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Change Password',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.key_outlined,
                                  color: AppColor.primary.withOpacity(.5),
                                  size: 19.2.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'KYC',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
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
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        SharedPreferencesService.instance.logOut();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Logout',
                            fontSize: 16.4.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.red,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.logout_outlined,
                            size: 19.2.sp,
                            color: AppColor.red,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
