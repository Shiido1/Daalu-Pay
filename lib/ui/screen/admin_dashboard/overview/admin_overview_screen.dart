import 'package:daalu_pay_admin/core/core_folder/app/app.router.dart';
import 'package:daalu_pay_admin/main.dart';
import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/contant.dart';
import '../../../widget/text_widget.dart';

class AdminOverviewScreen extends StatefulWidget {
  const AdminOverviewScreen({super.key});

  @override
  State<AdminOverviewScreen> createState() => _AdminOverviewScreenState();
}

class _AdminOverviewScreenState extends State<AdminOverviewScreen> {
  bool isTapped = false;
  bool? isSwitched;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getAdminStats(context);
            model.getAdminTransactions(context);
          });
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
                        text: 'Overview',
                        fontSize: 22.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: 36.0.w,
                        height: 50.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      overviewTransWidget(
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: AppColor.yellow,
                            size: 32.sp,
                          ),
                          text: TextView(
                            text: '${model.pend.length}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Pending Transactions'),
                      SizedBox(
                        width: 10.w,
                      ),
                      overviewTransWidget(
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: AppColor.green,
                            size: 32.sp,
                          ),
                          text: TextView(
                            text: '${model.app.length}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Approved Transactions'),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      overviewTransWidget(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColor.red,
                            size: 32.sp,
                          ),
                          text: TextView(
                            text: '${model.rej.length}',
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          text1: 'Rejected Transactions'),
                      SizedBox(
                        width: 10.w,
                      ),
                      SizedBox(
                        width: 170.w,
                      )
                    ],
                  ),
                  model.pend.isNotEmpty
                      ? SizedBox(
                          height: 60.h,
                        )
                      : const SizedBox.shrink(),
                  model.pend.isNotEmpty
                      ? TextView(
                          text: 'Pending Converts',
                          color: AppColor.greyKind,
                          fontSize: 19.2.sp,
                          fontWeight: FontWeight.w500,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(
                    height: 14.0.h,
                  ),
                  if (model.pend.isNotEmpty)
                    ...model.pend.reversed.map(
                      (o) => Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.w, horizontal: 16.w),
                        margin: EdgeInsets.only(bottom: 10.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            border: Border.all(color: AppColor.inGrey),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: TextView(
                                text: DateFormat('yyyy MMM dd, hh:mm a').format(
                                    DateTime.parse(o.createdAt.toString())),
                                fontSize: 14.8.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.grey,
                              ),
                            ),
                            TextView(
                              text: 'ID-: ${o.transactionId}',
                              fontSize: 17.4.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text:
                                  '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                              textStyle: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => model.modalBottomApproveSheet(
                                      context: context, id: o.id.toString()),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 6.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.green.withOpacity(.17),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          size: 24.sp,
                                          color: AppColor.deeperGreen,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        TextView(
                                          text: 'Approved',
                                          fontSize: 14.4.sp,
                                          color: AppColor.deeperGreen,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => model.modalBottomRejectSheet(
                                      context: context, id: o.id.toString()),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 6.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.red.withOpacity(.17),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.cancel_outlined,
                                          size: 24.sp,
                                          color: AppColor.red,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        TextView(
                                          text: 'Reject',
                                          fontSize: 14.4.sp,
                                          color: AppColor.red,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 6.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.greyKind.withOpacity(.17),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline_rounded,
                                        size: 24.sp,
                                        color: AppColor.greyNice,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      TextView(
                                        text: 'Hold',
                                        fontSize: 14.4.sp,
                                        color: AppColor.greyNice,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Transaction History',
                        color: AppColor.greyKind,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigate.navigateTo(Routes.adminTransactionScreen),
                        child: TextView(
                          text: 'View All',
                          color: AppColor.grey,
                          fontSize: 15.2.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  if (model.isLoading || model.adminStatsResponseModel == null)
                    SpinKitPouringHourGlassRefined(
                      color: AppColor.primary,
                      size: 43.0.sp,
                    )
                  else if (model.adminStatsResponseModel != null &&
                      model.adminStatsResponseModel!.data!.swaps!.isEmpty)
                    Center(
                      child: TextView(
                        text: 'No Transations',
                        fontSize: 20.sp,
                      ),
                    )
                  else if (model.adminStatsResponseModel != null ||
                      model.adminStatsResponseModel!.data!.swaps!.isNotEmpty)
                    ...model.adminStatsResponseModel!.data!.swaps!.map((o) =>
                        Container(
                          padding: EdgeInsets.all(18.w),
                          margin: EdgeInsets.only(bottom: 16.w),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.inGrey),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'ID:- ${o.transactionId}',
                                    fontSize: 17.4.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextView(
                                    text: DateFormat('yyyy-MM-dd hh:mm a')
                                        .format(DateTime.parse(
                                            o.createdAt.toString())),
                                    fontSize: 15.4.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextView(
                                    text:
                                        '${getAllCurrency(o.fromCurrency)}${oCcy.format(double.parse(o.fromAmount!))} -> ${oCcy.format(double.parse(o.toAmount!))}${getAllCurrency(o.toCurrency)}',
                                    textStyle: TextStyle(
                                      fontSize: 16.4.sp,
                                      fontWeight: FontWeight.w500,
                                      color: o.status == 'approved'
                                          ? AppColor.green
                                          : o.status == 'rejected'
                                              ? AppColor.red
                                              : AppColor.yellow,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 6.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: o.status == 'approved'
                                      ? AppColor.green.withOpacity(.2)
                                      : o.status == 'rejected'
                                          ? AppColor.red.withOpacity(.2)
                                          : AppColor.yellow.withOpacity(.2),
                                ),
                                child: TextView(
                                  text: o.status?.capitalize() ?? '',
                                  fontSize: 16.4.sp,
                                  color: o.status == 'approved'
                                      ? AppColor.green
                                      : o.status == 'rejected'
                                          ? AppColor.red
                                          : AppColor.yellow,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ))
                ],
              ),
            ),
          );
        });
  }

  overviewTransWidget(
          {required Widget icon,
          required Widget text,
          required String text1}) =>
      Expanded(
        child: Container(
          padding:
              EdgeInsets.only(top: 10.w, bottom: 10.w, right: 54.w, left: 10.w),
          decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(
                color: AppColor.inGrey,
              ),
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              SizedBox(
                height: 2.4.w,
              ),
              text,
              SizedBox(
                height: 2.4.w,
              ),
              SizedBox(
                width: 330.w,
                child: TextView(
                  text: text1,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  fontSize: 16.4.sp,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      );
}
