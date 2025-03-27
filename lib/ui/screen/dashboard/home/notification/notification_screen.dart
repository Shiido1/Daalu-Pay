import 'package:daalu_pay/core/core_folder/app/app.router.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:daalu_pay/ui/app_assets/contant.dart';
import 'package:daalu_pay/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/get_all_notifications_response_model/datum.dart';
import '../../../../../core/connect_end/view_model/auth_view_model.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        shadowColor: AppColor.navyBlueGrey,
        title: TextView(
          text: 'Messages',
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
        centerTitle: false,
        elevation: 0.1,
      ),
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.getAllNotifications(context);
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return RefreshIndicator(
              backgroundColor: AppColor.white,
              color: AppColor.primary,
              onRefresh: model.refreshNotification,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
                child: Column(
                  children: [
                    if (model.getAllNotificationsResponseModel == null)
                      Container()
                    else if (model
                        .getAllNotificationsResponseModel!.data!.isEmpty)
                      Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Center(
                          child: TextView(
                            text: 'No Message',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else if (model.getAllNotificationsResponseModel != null &&
                        model
                            .getAllNotificationsResponseModel!.data!.isNotEmpty)
                      ...model.getAllNotificationsResponseModel!.data!
                          .map((e) => notificationMessage(e))
                  ],
                ),
              ),
            );
          }),
    );
  }

  String formatTimestamp(String timestamp) {
    DateTime dateTime =
        DateTime.parse(timestamp).toLocal(); // Convert to local time
    return DateFormat('h:mm a').format(dateTime); // Format as "12:28 PM"
  }

  Widget notificationMessage(Datum? d) => GestureDetector(
        onTap: () => navigate.navigateTo(Routes.viewNotificationScreenMessage,
            arguments: ViewNotificationScreenMessageArguments(id: d!.id)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 200.w,
                    child: TextView(
                      text: d?.data?.title?.capitalize() ?? '',
                      fontSize: 17.10.sp,
                      fontWeight:
                          d?.readAt == null ? FontWeight.w600 : FontWeight.w400,
                      textOverflow: TextOverflow.ellipsis,
                    )),
                SizedBox(
                    width: 80.w,
                    child: TextView(
                      text: formatTimestamp(d?.createdAt?.toString() ?? ''),
                      fontSize: 16.sp,
                      fontWeight:
                          d?.readAt == null ? FontWeight.w600 : FontWeight.w400,
                      textOverflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            SizedBox(
                width: 300.w,
                child: TextView(
                  text: d?.data?.message ?? '',
                  fontWeight:
                      d?.readAt == null ? FontWeight.w600 : FontWeight.w400,
                  textOverflow: TextOverflow.ellipsis,
                )),
            Divider(
              thickness: .1,
              color: AppColor.grey,
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      );
}
