import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class AdminTransactionScreen extends StatelessWidget {
  const AdminTransactionScreen({super.key});
  paddedWing({child}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getAdminTransactions(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  paddedWing(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: AppColor.inGrey,
                              size: 20.sp,
                            )),
                        TextView(
                          text: 'Transactions',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.transparent,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  // paddedWing(
                  //   child: TextFormWidget(
                  //     label: 'Search',
                  //     labelColor: AppColor.grey,
                  //     hint: null,
                  //     border: 10,
                  //     borderColor: AppColor.transparent,
                  //     isFilled: true,
                  //     fillColor: AppColor.inGreyOut,
                  //     prefixWidget: Padding(
                  //       padding: EdgeInsets.all(12.w),
                  //       child: SvgPicture.asset(
                  //         AppImage.search,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 30.h,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 40.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: TextView(
                                    text: model.transStats.capitalize(),
                                    color: AppColor.darkGrey,
                                    fontSize: 15.6.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                PopupMenuButton(
                                  onSelected: (value) {
                                    // your logic
                                  },
                                  color: AppColor.white,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 20.sp,
                                  ),
                                  itemBuilder: (BuildContext bc) {
                                    return [
                                      PopupMenuItem(
                                        value: '/all',
                                        onTap: () {
                                          model.transStats = 'all';
                                          model.secgroupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'All',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/approved',
                                        onTap: () {
                                          model.transStats = 'approved';
                                          model.secgroupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Approved',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/pending',
                                        onTap: () {
                                          model.transStats = 'pending';
                                          model.secgroupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Pending',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: '/rejected',
                                        onTap: () {
                                          model.transStats = 'rejected';
                                          model.secgroupTransationStatus();
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text: 'Rejected',
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ];
                                  },
                                )
                              ],
                            )),
                      ),
                      Expanded(
                        child: Container(
                          height: 40.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                          ),
                          child: Center(
                            child: TextView(
                              text: '',
                              color: AppColor.darkGrey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  paddedWing(
                    child: TextView(
                      text: 'Recent Transaction',
                      color: AppColor.greyKind,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (model.isLoading ||
                      model.adminTransactionsResponseModel == null)
                    Padding(
                      padding: EdgeInsets.only(top: 30.w),
                      child: SpinKitPouringHourGlassRefined(
                        color: AppColor.primary,
                        size: 43.0.sp,
                      ),
                    )
                  else if (model.adminTransactionsResponseModel != null &&
                      model.adminTransactionsResponseModel!.data!.isEmpty)
                    Center(
                      child: TextView(
                        text: 'No Transations',
                        fontSize: 20.sp,
                      ),
                    )
                  else
                    Column(
                      children: [
                        if (model.transactionListData!.isNotEmpty)
                          ...model.transactionListData!.reversed.map((o) =>
                              paddedWing(
                                child: Container(
                                  padding: EdgeInsets.all(10.w),
                                  margin: EdgeInsets.only(bottom: 16.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border:
                                          Border.all(color: AppColor.inGrey),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'ID:- ${o.transactionId}',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: 20.w,
                                          ),
                                          TextView(
                                            text: DateFormat(
                                                    'yyyy-MM-dd hh:mm a')
                                                .format(DateTime.parse(
                                                    o.createdAt.toString())),
                                            fontSize: 14.sp,
                                            color: AppColor.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextView(
                                            text:
                                                '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                                            textStyle: TextStyle(
                                              color: o.status == 'approved'
                                                  ? AppColor.green
                                                  : o.status == 'rejected'
                                                      ? AppColor.red
                                                      : AppColor.yellow,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.w,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 6.w),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: o.status == 'approved'
                                                  ? AppColor.green
                                                      .withOpacity(.2)
                                                  : o.status == 'rejected'
                                                      ? AppColor.red
                                                          .withOpacity(.2)
                                                      : AppColor.yellow
                                                          .withOpacity(.2),
                                            ),
                                            child: TextView(
                                              text:
                                                  o.status?.capitalize() ?? '',
                                              fontSize: 14.sp,
                                              color: o.status == 'approved'
                                                  ? AppColor.green
                                                  : o.status == 'rejected'
                                                      ? AppColor.red
                                                      : AppColor.yellow,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        else
                          ...model
                              .adminTransactionsResponseModel!.data!.reversed
                              .map((o) => paddedWing(
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      margin: EdgeInsets.only(bottom: 16.w),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          border: Border.all(
                                              color: AppColor.inGrey),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text: 'ID:- ${o.transactionId}',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              TextView(
                                                text: DateFormat(
                                                        'yyyy-MM-dd hh:mm a')
                                                    .format(DateTime.parse(o
                                                        .createdAt
                                                        .toString())),
                                                fontSize: 14.sp,
                                                color: AppColor.grey,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 130.w,
                                                child: TextView(
                                                  text:
                                                      '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                                                  textStyle: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: o.status ==
                                                            'approved'
                                                        ? AppColor.green
                                                        : o.status == 'rejected'
                                                            ? AppColor.red
                                                            : AppColor.yellow,
                                                  ),
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                    vertical: 6.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: o.status == 'approved'
                                                      ? AppColor.green
                                                          .withOpacity(.2)
                                                      : o.status == 'rejected'
                                                          ? AppColor.red
                                                              .withOpacity(.2)
                                                          : AppColor.yellow
                                                              .withOpacity(.2),
                                                ),
                                                child: TextView(
                                                  text:
                                                      o.status?.capitalize() ??
                                                          '',
                                                  fontSize: 14.sp,
                                                  color: o.status == 'approved'
                                                      ? AppColor.green
                                                      : o.status == 'rejected'
                                                          ? AppColor.red
                                                          : AppColor.yellow,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                      ],
                    )
                ],
              ),
            ),
          );
        });
  }
}
