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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 50.w),
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
                          label: 'Search name',
                          labelColor: AppColor.grey,
                          hint: null,
                          border: 10,
                          borderColor: AppColor.transparent,
                          isFilled: true,
                          fillColor: AppColor.inGreyOut,
                          onChange: (p0) {
                            model.query = p0;
                            model.notifyListeners();
                          },
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: SvgPicture.asset(
                              AppImage.search,
                            ),
                          ),
                          controller: model.usernameController,
                          // validator: AppValidator.validateEmail(),
                        ),
                      ),
                      SizedBox(
                        width: 18.w,
                      ),
                      PopupMenuButton(
                        onSelected: (value) {
                          // your logic
                        },
                        color: AppColor.white,
                        child: SvgPicture.asset(AppImage.filter),
                        itemBuilder: (BuildContext bc) {
                          return [
                            PopupMenuItem(
                              value: '/all',
                              onTap: () {
                                model.userStats = 'all';
                                model.usergroupTransationStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'All',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/active',
                              onTap: () {
                                model.userStats = 'active';
                                model.usergroupTransationStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Active',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/suspended',
                              onTap: () {
                                model.userStats = 'suspended';
                                model.usergroupTransationStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Suspended',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/band',
                              onTap: () {
                                model.userStats = 'band';
                                model.usergroupTransationStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Band',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            PopupMenuItem(
                              value: '/unverified',
                              onTap: () {
                                model.userStats = 'unverified';
                                model.usergroupTransationStatus();
                                model.notifyListeners();
                              },
                              child: TextView(
                                text: 'Unverified',
                                fontSize: 15.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ];
                        },
                      ),
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
                                  model.query != ''
                                      ? Column(
                                          children: [
                                            if (model.userListData!.isNotEmpty)
                                              ...model.userListData!
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((i) => Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () => model
                                                                .openDialog(
                                                                    context:
                                                                        context,
                                                                    data: i),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        i.firstName ??
                                                                            '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      134.0.w,
                                                                  child:
                                                                      TextView(
                                                                    text: i.email
                                                                            ?.toLowerCase() ??
                                                                        '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal: i.status ==
                                                                              'active'
                                                                          ? 8.w
                                                                          : 3.2
                                                                              .w,
                                                                      vertical:
                                                                          5.2.w),
                                                                  decoration: BoxDecoration(
                                                                      color: i.status ==
                                                                              'active'
                                                                          ? AppColor.green.withOpacity(
                                                                              .17)
                                                                          : AppColor.greyKind.withOpacity(
                                                                              .17),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child:
                                                                      TextView(
                                                                    text: i.status
                                                                            ?.capitalize() ??
                                                                        '',
                                                                    fontSize: i.status ==
                                                                            'active'
                                                                        ? 12.4
                                                                            .sp
                                                                        : 10.sp,
                                                                    color: i.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .deeperGreen
                                                                        : AppColor
                                                                            .greyKind,
                                                                    fontWeight: i.status ==
                                                                            'active'
                                                                        ? FontWeight
                                                                            .w500
                                                                        : FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                PopupMenuButton(
                                                                  onSelected:
                                                                      (value) {
                                                                    // your logic
                                                                  },
                                                                  color: AppColor
                                                                      .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20.sp,
                                                                  ),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                          bc) {
                                                                    return [
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/suspend',
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            TextView(
                                                                          text:
                                                                              'Suspend',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/delete',
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            TextView(
                                                                          text:
                                                                              'Delete',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ];
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                            else if (model
                                                        .allUserResponseModel !=
                                                    null &&
                                                model.allUserResponseModel!
                                                    .data!.isNotEmpty)
                                              ...model
                                                  .allUserResponseModel!.data!
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((i) => Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () => model
                                                                .openDialog(
                                                                    context:
                                                                        context,
                                                                    data: i),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        i.firstName ??
                                                                            '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      134.0.w,
                                                                  child:
                                                                      TextView(
                                                                    text: i.email
                                                                            ?.toLowerCase() ??
                                                                        '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal: i.status ==
                                                                              'active'
                                                                          ? 8.w
                                                                          : 3.2
                                                                              .w,
                                                                      vertical:
                                                                          5.2.w),
                                                                  decoration: BoxDecoration(
                                                                      color: i.status ==
                                                                              'active'
                                                                          ? AppColor.green.withOpacity(
                                                                              .17)
                                                                          : AppColor.greyKind.withOpacity(
                                                                              .17),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child:
                                                                      TextView(
                                                                    text: i.status
                                                                            ?.capitalize() ??
                                                                        '',
                                                                    fontSize: i.status ==
                                                                            'active'
                                                                        ? 12.4
                                                                            .sp
                                                                        : 10.sp,
                                                                    color: i.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .deeperGreen
                                                                        : AppColor
                                                                            .greyKind,
                                                                    fontWeight: i.status ==
                                                                            'active'
                                                                        ? FontWeight
                                                                            .w500
                                                                        : FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                PopupMenuButton(
                                                                  onSelected:
                                                                      (value) {
                                                                    // your logic
                                                                  },
                                                                  color: AppColor
                                                                      .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20.sp,
                                                                  ),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                          bc) {
                                                                    return [
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/suspend',
                                                                        onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                            context:
                                                                                context,
                                                                            id: i
                                                                                .id,
                                                                            status:
                                                                                i.status),
                                                                        child:
                                                                            TextView(
                                                                          text: i.status?.toLowerCase() == 'active'
                                                                              ? 'Suspend'
                                                                              : "Unsuspend",
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/delete',
                                                                        onTap: () =>
                                                                            model.modalBottomDeleteUserSheet(
                                                                          context,
                                                                          id: i
                                                                              .id,
                                                                        ),
                                                                        child:
                                                                            TextView(
                                                                          text:
                                                                              'Delete',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ];
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            if (model.userListData!.isNotEmpty)
                                              ...model.userListData!
                                                  .where((o) => o.firstName!
                                                      .toLowerCase()
                                                      .contains(model.query
                                                          .toLowerCase()))
                                                  .map((i) => Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () => model
                                                                .openDialog(
                                                                    context:
                                                                        context,
                                                                    data: i),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        i.firstName ??
                                                                            '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      134.0.w,
                                                                  child:
                                                                      TextView(
                                                                    text: i.email
                                                                            ?.toLowerCase() ??
                                                                        '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal: i.status ==
                                                                              'active'
                                                                          ? 8.w
                                                                          : 3.2
                                                                              .w,
                                                                      vertical:
                                                                          5.2.w),
                                                                  decoration: BoxDecoration(
                                                                      color: i.status ==
                                                                              'active'
                                                                          ? AppColor.green.withOpacity(
                                                                              .17)
                                                                          : AppColor.greyKind.withOpacity(
                                                                              .17),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child:
                                                                      TextView(
                                                                    text: i.status
                                                                            ?.capitalize() ??
                                                                        '',
                                                                    fontSize: i.status ==
                                                                            'active'
                                                                        ? 12.4
                                                                            .sp
                                                                        : 10.sp,
                                                                    color: i.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .deeperGreen
                                                                        : AppColor
                                                                            .greyKind,
                                                                    fontWeight: i.status ==
                                                                            'active'
                                                                        ? FontWeight
                                                                            .w500
                                                                        : FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                PopupMenuButton(
                                                                  onSelected:
                                                                      (value) {
                                                                    // your logic
                                                                  },
                                                                  color: AppColor
                                                                      .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20.sp,
                                                                  ),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                          bc) {
                                                                    return [
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/suspend',
                                                                        onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                            context:
                                                                                context,
                                                                            id: i
                                                                                .id,
                                                                            status:
                                                                                i.status),
                                                                        child:
                                                                            TextView(
                                                                          text: i.status?.toLowerCase() == 'active'
                                                                              ? 'Suspend'
                                                                              : "Unsuspend",
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/delete',
                                                                        onTap: () =>
                                                                            model.modalBottomDeleteUserSheet(
                                                                          context,
                                                                          id: i
                                                                              .id,
                                                                        ),
                                                                        child:
                                                                            TextView(
                                                                          text:
                                                                              'Delete',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ];
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                            else if (model
                                                        .allUserResponseModel !=
                                                    null &&
                                                model.allUserResponseModel!
                                                    .data!.isNotEmpty)
                                              ...model
                                                  .allUserResponseModel!.data!
                                                  .map((i) => Column(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () => model
                                                                .openDialog(
                                                                    context:
                                                                        context,
                                                                    data: i),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                  width: 60.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        i.firstName ??
                                                                            '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      134.0.w,
                                                                  child:
                                                                      TextView(
                                                                    text: i.email
                                                                            ?.toLowerCase() ??
                                                                        '',
                                                                    fontSize:
                                                                        14.sp,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal: i.status ==
                                                                              'active'
                                                                          ? 8.w
                                                                          : 3.2
                                                                              .w,
                                                                      vertical:
                                                                          5.2.w),
                                                                  decoration: BoxDecoration(
                                                                      color: i.status ==
                                                                              'active'
                                                                          ? AppColor.green.withOpacity(
                                                                              .17)
                                                                          : AppColor.greyKind.withOpacity(
                                                                              .17),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4)),
                                                                  child:
                                                                      TextView(
                                                                    text: i.status
                                                                            ?.capitalize() ??
                                                                        '',
                                                                    fontSize: i.status ==
                                                                            'active'
                                                                        ? 12.4
                                                                            .sp
                                                                        : 10.sp,
                                                                    color: i.status ==
                                                                            'active'
                                                                        ? AppColor
                                                                            .deeperGreen
                                                                        : AppColor
                                                                            .greyKind,
                                                                    fontWeight: i.status ==
                                                                            'active'
                                                                        ? FontWeight
                                                                            .w500
                                                                        : FontWeight
                                                                            .w600,
                                                                  ),
                                                                ),
                                                                PopupMenuButton(
                                                                  onSelected:
                                                                      (value) {
                                                                    // your logic
                                                                  },
                                                                  color: AppColor
                                                                      .white,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .more_vert,
                                                                    size: 20.sp,
                                                                  ),
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                          bc) {
                                                                    return [
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/suspend',
                                                                        onTap: () => model.modalBottomSuspendAndUnsuspendSheet(
                                                                            context:
                                                                                context,
                                                                            id: i
                                                                                .id,
                                                                            status:
                                                                                i.status),
                                                                        child:
                                                                            TextView(
                                                                          text: i.status?.toLowerCase() == 'active'
                                                                              ? 'Suspend'
                                                                              : "Unsuspend",
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                      PopupMenuItem(
                                                                        value:
                                                                            '/delete',
                                                                        onTap: () =>
                                                                            model.modalBottomDeleteUserSheet(
                                                                          context,
                                                                          id: i
                                                                              .id,
                                                                        ),
                                                                        child:
                                                                            TextView(
                                                                          text:
                                                                              'Delete',
                                                                          fontSize:
                                                                              14.2.sp,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ];
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.inGrey,
                                                            thickness: .3.sp,
                                                          ),
                                                        ],
                                                      ))
                                          ],
                                        )
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
}
