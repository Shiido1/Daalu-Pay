import 'package:daalu_pay_admin/core/core_folder/app/app.router.dart';
import 'package:daalu_pay_admin/main.dart';
import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/contant.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ViewUsersReceiptScreen extends StatelessWidget {
  const ViewUsersReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getUsersReceipt(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColor.white.withOpacity(.99),
            body: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.w, vertical: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        TextView(
                          text: 'Alipay Receipts',
                          fontSize: 21.2.sp,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (model.isLoading ||
                            model.getUsersReceiptResponseMode == null)
                          SpinKitPouringHourGlassRefined(
                            color: AppColor.primary,
                            size: 43.0.sp,
                          )
                        else if (model.getUsersReceiptResponseMode != null &&
                            model.getUsersReceiptResponseMode!.data!.isEmpty)
                          Center(
                            child: TextView(
                              text: 'No Receipts',
                              fontSize: 20.sp,
                            ),
                          )
                        else if (model.getUsersReceiptResponseMode != null ||
                            model.getUsersReceiptResponseMode!.data!.isNotEmpty)
                          ...model.getUsersReceiptResponseMode!.data!.map((o) =>
                              GestureDetector(
                                onTap: () => navigate.navigateTo(
                                    Routes.viewReceipt,
                                    arguments: ViewReceiptArguments(datum: o)),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 12.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: AppColor.grey.withOpacity(.3),
                                          width: 1.4)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text:
                                                '${getAllCurrency('CNY')}${oCcy.format(double.parse(o.amount!))}',
                                            fontSize: 18.sp,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Container(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      horizontal: 6.w,
                                                      vertical: 4.w),
                                              decoration: BoxDecoration(
                                                  color: o.status
                                                              ?.toLowerCase() ==
                                                          'pending'
                                                      ? AppColor.grey
                                                          .withOpacity(.2)
                                                      : o.status?.toLowerCase() ==
                                                              'completed'
                                                          ? AppColor.green
                                                              .withOpacity(.2)
                                                          : AppColor.red
                                                              .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: TextView(
                                                  text: o.status
                                                              ?.toLowerCase() ==
                                                          'pending'
                                                      ? 'Pending'
                                                      : o.status?.toLowerCase() ==
                                                              'completed'
                                                          ? 'Approved'
                                                          : 'Denied',
                                                  fontSize: 14.8.sp,
                                                  color: o.status
                                                              ?.toLowerCase() ==
                                                          'pending'
                                                      ? AppColor.grey
                                                      : o.status?.toLowerCase() ==
                                                              'completed'
                                                          ? AppColor.green
                                                          : AppColor.red)),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          TextView(
                                            text: DateFormat(
                                                    'yyyy MMM dd, hh:mm a')
                                                .format(DateTime.parse(
                                                    o.createdAt.toString())),
                                            fontSize: 14.4.sp,
                                            color: AppColor.grey,
                                          ),
                                        ],
                                      ),
                                      o.documentType == 'alipay_id'
                                          ? QrImageView(
                                              data: o.recipientAlipayId ?? '',
                                              version: QrVersions.auto,
                                              size: 90,
                                              gapless: false,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${o.recipientAlipayId}',
                                                width: 90.w,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ))
                      ],
                    ),
                  ),
                  model.isLoadingReceipts
                      ? Align(
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 2,
                            shadowColor: AppColor.greyKind,
                            child: Container(
                              height: 100.h,
                              width: 120.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  SpinKitCircle(
                                    color: AppColor.primary,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextView(
                                    text: 'Loading Receipt..!',
                                    fontSize: 10.2.sp,
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ]),
          );
        });
  }
}
