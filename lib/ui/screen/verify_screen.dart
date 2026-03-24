import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../app_assets/app_color.dart';
import '../widget/button_widget.dart';
import '../widget/text_widget.dart';

// ignore: must_be_immutable
class VerifyScreen extends StatefulWidget {
  VerifyScreen({super.key, required this.email});
  String? email;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {
          viewModel.timer?.cancel();
        },
        builder: (_, AuthViewModel model, __) {
          return Scaffold(
            backgroundColor: AppColor.light,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 100.w, horizontal: 18.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Verify your email',
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextView(
                      text: 'Please enter the OTP sent to',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                    TextView(
                      text: widget.email ?? '',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 6.w),
                        child: PinInputFormField(
                          length: 5,
                          obscureText: true,
                          validator: (v) {
                            if (v!.length < 5) {
                              return "Input proper OTP";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            print("Completed $v");
                            textEditingController.text = v;
                            setState(() {});
                            model.notifyListeners();
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          pinBuilder:
                              (BuildContext context, List<PinCellData> cells) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: cells.map((cell) {
                                return Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: cell.isFocused
                                        ? Colors.blue
                                        : Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Text(
                                      cell.character ?? '',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        )),
                    SizedBox(
                      height: 370.h,
                    ),
                    ButtonWidget(
                        buttonText: 'Verify account',
                        color: AppColor.white,
                        border: 8,
                        isLoading: model.isLoading,
                        buttonColor: AppColor.primary,
                        buttonBorderColor: Colors.transparent,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            model.validateOtp(context,
                                otp: textEditingController.text,
                                email: widget.email);
                          }
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await model.requestOtp(context, email: widget.email);
                        model.startTimer();
                      },
                      child: TextView(
                        text: model.startTimerCount > 1
                            ? 'Request OTP: Expires in ${model.startTimerCount} seconds'
                            : 'Request OTP',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.grey,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
