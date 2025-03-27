import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class ViewNotificationScreenMessage extends StatelessWidget {
  ViewNotificationScreenMessage({super.key, required this.id});
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        shadowColor: AppColor.navyBlueGrey,
        title: TextView(
          text: 'Message',
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
        centerTitle: false,
        elevation: 0.1,
      ),
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.getANotificationMessage(context, id);
            await model.markMessageAsRead(context, id);
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 30.w),
              child: Column(
                children: [
                  if (model.getANotificationMessageModel == null)
                    Container()
                  else if (model.getANotificationMessageModel != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.w, horizontal: 12.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColor.inGrey),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: model.getANotificationMessageModel?.datum
                                        ?.data?.title ??
                                    '',
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextView(
                                text: model.getANotificationMessageModel?.datum
                                        ?.data?.message ??
                                    '',
                                fontSize: 14.80.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                        TextView(
                          text: '',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          textOverflow: TextOverflow.ellipsis,
                        )
                      ],
                    )
                ],
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
}
