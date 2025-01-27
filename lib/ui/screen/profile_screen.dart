import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../widget/button_widget.dart';
import '../widget/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.light,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.getUser(context);
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: TextView(
                      text: 'User Profile',
                      fontSize: 22.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(20, 196, 198, 201),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColor.inGrey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_pin_circle_outlined,
                                    color: AppColor.primary.withOpacity(.6),
                                    size: 22.sp,
                                  ),
                                  TextView(
                                    text: 'Firstname:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              TextView(
                                text:
                                    '${model.userResponseModel?.data?.firstName}'
                                        .capitalize(),
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person_pin_circle_outlined,
                                    color: AppColor.primary.withOpacity(.6),
                                    size: 22.sp,
                                  ),
                                  TextView(
                                    text: 'Lastname:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              TextView(
                                text:
                                    '${model.userResponseModel?.data?.lastName}'
                                        .capitalize(),
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: AppColor.primary.withOpacity(.6),
                                      size: 20.sp,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Email:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              TextView(
                                text: '${model.userResponseModel?.data?.email}',
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      Icons.person_2_outlined,
                                      color: AppColor.primary.withOpacity(.6),
                                      size: 20.sp,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Gender:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              TextView(
                                text: '${model.userResponseModel?.data?.gender}'
                                    .capitalize(),
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      Icons.phone_in_talk_sharp,
                                      color: AppColor.primary.withOpacity(.6),
                                      size: 20.sp,
                                    ),
                                  ),
                                  TextView(
                                    text: 'Phone Number:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              TextView(
                                text: '${model.userResponseModel?.data?.phone}',
                                fontSize: 14.4.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      Icons.ac_unit_rounded,
                                      color: AppColor.primary.withOpacity(.6),
                                      size: 20.sp,
                                    ),
                                  ),
                                  TextView(
                                    text: 'User Status:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: model.userResponseModel?.data?.status
                                                ?.toLowerCase() ==
                                            'active'
                                        ? AppColor.green.withOpacity(.8)
                                        : AppColor.inGrey),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.w, horizontal: 6.w),
                                child: TextView(
                                  text:
                                      '${model.userResponseModel?.data?.status}'
                                          .capitalize(),
                                  fontSize: 13.4.sp,
                                  color: model.userResponseModel?.data?.status
                                              ?.toLowerCase() ==
                                          'active'.toLowerCase()
                                      ? AppColor.white
                                      : AppColor.darkGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.grey,
                          thickness: .4.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Icon(
                                      Icons.ac_unit_rounded,
                                      color: AppColor.primary.withOpacity(.6),
                                      size: 20.sp,
                                    ),
                                  ),
                                  TextView(
                                    text: 'KYC Status:',
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: model.userResponseModel?.data
                                                ?.kycStatus
                                                ?.toLowerCase() ==
                                            'approved'
                                        ? AppColor.green.withOpacity(.8)
                                        : AppColor.inGrey),
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.w, horizontal: 6.w),
                                child: TextView(
                                  text:
                                      '${model.userResponseModel?.data?.status}'
                                          .capitalize(),
                                  fontSize: 13.4.sp,
                                  color: model.userResponseModel?.data?.status
                                              ?.toLowerCase() ==
                                          'approved'.toLowerCase()
                                      ? AppColor.white
                                      : AppColor.darkGrey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  ButtonWidget(
                      buttonText: 'Update Profile',
                      color: AppColor.white,
                      border: 8,
                      isLoading: model.isLoading,
                      buttonColor: AppColor.primary,
                      buttonBorderColor: Colors.transparent,
                      onPressed: () =>
                          navigate.navigateTo(Routes.updateProfileScreen)),
                ],
              ),
            );
          }),
    );
  }
}
