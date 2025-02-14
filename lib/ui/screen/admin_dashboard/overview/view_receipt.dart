import 'package:daalu_pay_admin/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/model/get_users_receipt_response_model/datum.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class ViewReceipt extends StatelessWidget {
  ViewReceipt({super.key, required this.datum});

  Datum? datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 70.w, horizontal: 28.w),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text: 'View Receipt',
              fontSize: 24.0.sp,
              color: AppColor.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 23.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${datum?.receipt}',
                width: 300.w,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Status: ${datum?.status}'.capitalize(),
              fontSize: 20.sp,
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextView(
              text:
                  'Amount: ${getAllCurrency('CNY')}${oCcy.format(double.parse(datum?.amount ?? '0.0'))}',
              fontSize: 24.sp,
              color: AppColor.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 50.h,
            ),
            datum?.status?.toLowerCase() == "approved"
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ViewModelBuilder<AuthViewModel>.reactive(
                          viewModelBuilder: () => AuthViewModel(),
                          onViewModelReady: (model) {},
                          disposeViewModel: false,
                          builder: (_, AuthViewModel model, __) {
                            return GestureDetector(
                              onTap: () =>
                                  model.modalBottomApproveReceiptsSheet(
                                      context: context,
                                      id: datum?.id.toString()),
                              child: Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 10.w, vertical: 4.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.green,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: TextView(
                                    text: 'Approve',
                                    fontSize: 18.sp,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                            );
                          }),
                      SizedBox(
                        width: 40.h,
                      ),
                      ViewModelBuilder<AuthViewModel>.reactive(
                          viewModelBuilder: () => AuthViewModel(),
                          onViewModelReady: (model) {},
                          disposeViewModel: false,
                          builder: (_, AuthViewModel model, __) {
                            return GestureDetector(
                              onTap: () => model.modalBottomRejectReceiptSheet(
                                  context: context, id: datum?.id.toString()),
                              child: Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 17.0.w, vertical: 4.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.red,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: TextView(
                                    text: 'Deny',
                                    fontSize: 18.2.sp,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                            );
                          }),
                    ],
                  ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
