import 'package:daalu_pay/core/core_folder/manager/shared_preference.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/model/get_message_response/datum.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_validatiion.dart';
import '../widget/text_form_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: true,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          onViewModelReady: (model) async {
            await model.initiateMessage(context);
            model.getMessage(context,
                id: model.initiateChatResponseModel?.data?.id.toString());
          },
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SafeArea(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 16.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => navigate.back(),
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20.sp,
                              )),
                          TextView(
                            text: 'Message',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                          SizedBox(
                            width: 40.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          // ignore: unnecessary_null_comparison
                          if (model.getMessageResponse! == null ||
                              model.getMessageResponse!.data!.isEmpty)
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.w),
                                child: TextView(
                                  text: 'No Message',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.greyNice,
                                ),
                              ),
                            ),
                          ...model.getMessageResponse!.data!
                              .map((e) => chatWidget(e)),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  model.initiateChatResponseModel == null ||
                          model.initiateChatResponseModel?.data?.id == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.w),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColor.grey,
                                      size: 30.sp,
                                    )),
                              ),
                              SizedBox(
                                width: 260.w,
                                child: TextFormWidget(
                                  label: '',
                                  hint: '',
                                  border: 10,
                                  isFilled: true,
                                  fillColor: AppColor.white,
                                  controller: chatController,
                                  validator: AppValidator.validateString(),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 16.w, right: 10.w),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.send,
                                      color: AppColor.primary,
                                      size: 30.sp,
                                    )),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            );
          }),
    );
  }

  chatWidget(Datum e) => Column(
        children: [
          if (SharedPreferencesService.instance.usersData['user']['id'] !=
              e.senderId)
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20.w, right: 100.w),
                padding: EdgeInsets.all(8.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                    ),
                    color: AppColor.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: e.message ?? '',
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColor.white,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '09:45PM',
                      fontSize: 11.2.sp,
                      fontWeight: FontWeight.w200,
                      color: AppColor.white,
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(
            height: 20.h,
          ),
          if (SharedPreferencesService.instance.usersData['user']['id'] ==
              e.senderId)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: 20.w, left: 100.w),
                padding: EdgeInsets.all(8.0.w),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary, width: .3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
                    color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: e.message ?? "",
                      fontSize: 13.2.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    TextView(
                      text: '09:45PM',
                      fontSize: 11.2.sp,
                      fontWeight: FontWeight.w200,
                      color: AppColor.primary,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
}
