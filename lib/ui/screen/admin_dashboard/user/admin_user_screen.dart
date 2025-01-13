import 'package:daalu_pay_admin/ui/app_assets/contant.dart';
import 'package:daalu_pay_admin/ui/widget/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class AdminUsersScreen extends StatelessWidget {
  const AdminUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => model.getAllUser(context));
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 36.0.w,
                        height: 50.h,
                      ),
                      TextView(
                        text: 'User Management',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SvgPicture.asset(
                        AppImage.person,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormWidget(
                          label: 'Search',
                          labelColor: AppColor.grey,
                          hint: null,
                          border: 10,
                          borderColor: AppColor.transparent,
                          isFilled: true,
                          fillColor: AppColor.inGreyOut,
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(
                              AppImage.search,
                            ),
                          ),
                          // controller: emailController,
                          // validator: AppValidator.validateEmail(),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      SvgPicture.asset(AppImage.filter)
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  model.allUserResponseModel == null
                      ? SpinKitPouringHourGlassRefined(
                          color: AppColor.primary,
                          size: 43.0.sp,
                        )
                      : model.allUserResponseModel!.data!.isEmpty
                          ? Center(
                              child: TextView(
                                text: 'No User',
                                fontSize: 20.sp,
                              ),
                            )
                          : Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 14.w),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  border: Border.all(color: AppColor.inGrey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text: 'Name',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        TextView(
                                          text: 'Email',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.navyBlueGrey,
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        TextView(
                                          text: 'Status',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        TextView(
                                          text: 'Actions',
                                          fontSize: 14.sp,
                                          color: AppColor.navyBlueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: AppColor.inGrey,
                                    thickness: .3.sp,
                                  ),
                                  if (model.allUserResponseModel != null &&
                                      model.allUserResponseModel!.data!
                                          .isNotEmpty)
                                    ...model.allUserResponseModel!.data!
                                        .map((i) => Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      openDialog(context),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 60.w,
                                                        child: TextView(
                                                          text:
                                                              i.firstName ?? '',
                                                          fontSize: 14.sp,
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 134.0.w,
                                                        child: TextView(
                                                          text: i.email ?? '',
                                                          fontSize: 14.sp,
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 8.w,
                                                                vertical:
                                                                    5.2.w),
                                                        decoration: BoxDecoration(
                                                            color: i.status ==
                                                                    'active'
                                                                ? AppColor.green
                                                                    .withOpacity(
                                                                        .17)
                                                                : AppColor
                                                                    .greyKind
                                                                    .withOpacity(
                                                                        .17),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                        child: TextView(
                                                          text: i.status
                                                                  ?.capitalize() ??
                                                              '',
                                                          fontSize: 12.4.sp,
                                                          color: i.status ==
                                                                  'active'
                                                              ? AppColor
                                                                  .deeperGreen
                                                              : AppColor
                                                                  .greyKind,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.more_vert,
                                                            size: 20.sp,
                                                            color:
                                                                AppColor.black,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: AppColor.inGrey,
                                                  thickness: .3.sp,
                                                ),
                                              ],
                                            ))
                                ],
                              ),
                            )
                ],
              ),
            ),
          );
        });
  }

  paddedWing({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );

  Future openDialog(context) => showDialog(
        context: context,
        builder: (context) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 100.w),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: Scaffold(
            backgroundColor: AppColor.transparent,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 33.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddedWing(
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.navyBlueGrey),
                      child: TextView(
                        text: 'JD',
                        fontSize: 16.4.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.2.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'Active',
                      fontSize: 14.4.sp,
                      color: AppColor.deeperGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.2.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'Last Active - 2 secs ago',
                      fontSize: 14.4.sp,
                      color: AppColor.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'Jane Doe',
                      fontSize: 15.4.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'jane.doe@example.com',
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'ID- #81671ABO',
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'Recent Transactions',
                      fontSize: 15.4.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4.2.h,
                  ),
                  Divider(
                    color: AppColor.grey,
                    thickness: .3.sp,
                  ),
                  SizedBox(
                    height: 4.2.h,
                  ),
                  paddedWing(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Txn ID',
                          fontSize: 14.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                        TextView(
                          text: 'Amount',
                          fontSize: 14.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                        TextView(
                          text: 'Status',
                          fontSize: 14.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                        TextView(
                          text: 'Date',
                          fontSize: 14.sp,
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.2.h,
                  ),
                  ...[
                    1,
                    2,
                    3,
                    4,
                  ].map((e) => contRecentTranWidget()),
                  SizedBox(
                    height: 12.2.h,
                  ),
                  paddedWing(
                    child: TextFormWidget(
                      label: 'Add Notes',
                      hint: null,
                      border: 10,
                      maxline: 4,
                      isFilled: true,
                      fillColor: AppColor.white,
                      alignLabelWithHint: true,
                      // controller: emailController,
                      // validator: AppValidator.validateEmail(),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  paddedWing(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.w, horizontal: 22.w),
                          decoration: BoxDecoration(
                              color: AppColor.yellow.withOpacity(.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImage.flag),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextView(
                                text: 'Flag',
                                fontSize: 14.sp,
                                color: AppColor.yellow,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.w, horizontal: 22.w),
                          decoration: BoxDecoration(
                              color: AppColor.grey.withOpacity(.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.pause_circle_outline,
                                color: AppColor.darkGrey,
                                size: 24.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextView(
                                text: 'Suspend',
                                fontSize: 14.sp,
                                color: AppColor.darkGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  contRecentTranWidget() => Column(
        children: [
          Divider(
            color: AppColor.grey,
            thickness: .3.sp,
          ),
          SizedBox(
            height: 4.2.h,
          ),
          paddedWing(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: '#81671',
                  fontSize: 14.sp,
                  color: AppColor.greyNice,
                  fontWeight: FontWeight.w500,
                ),
                TextView(
                  text: '100,000,000 NGN',
                  fontSize: 14.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.green.withOpacity(.2)),
                  child: TextView(
                    text: 'Approved',
                    fontSize: 12.sp,
                    color: AppColor.deeperGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: '99/99/2025',
                  fontSize: 12.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      );
}
