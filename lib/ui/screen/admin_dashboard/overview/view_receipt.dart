import 'package:daalu_pay_admin/ui/app_assets/contant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_users_receipt_response_model/datum.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/app_utils.dart';
import '../../../app_assets/app_validatiion.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class ViewReceipt extends StatefulWidget {
  ViewReceipt({super.key, required this.datum});

  Datum? datum;

  @override
  State<ViewReceipt> createState() => _ViewReceiptState();
}

class _ViewReceiptState extends State<ViewReceipt> {
  TextEditingController recipientWalletIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => locator<AuthViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, AuthViewModel model, __) {
            return SingleChildScrollView(
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
                  widget.datum?.documentType == 'alipay_id'
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.all(20.w),
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.grey.withOpacity(.4)),
                                borderRadius: BorderRadius.circular(6)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 6.h,
                                ),
                                TextView(
                                  text: 'Scan QR Code to Pay',
                                  fontSize: 18.sp,
                                  color: AppColor.darkGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                QrImageView(
                                  data: widget.datum?.recipientAlipayId ?? '',
                                  version: QrVersions.auto,
                                  size: 200,
                                  gapless: false,
                                ),
                                SizedBox(
                                  height: 14.20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextView(
                                      text: 'Copy address:',
                                      fontSize: 15.2.sp,
                                      color: AppColor.darkGrey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 10.h),
                                    IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text: widget.datum
                                                      ?.recipientAlipayId ??
                                                  ''));
                                          AppUtils.snackbar(context,
                                              message:
                                                  'Barcode Address Copied..!');
                                        },
                                        icon: Icon(
                                          Icons.copy,
                                          color: AppColor.black,
                                          size: 24.0.sp,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${widget.datum?.recipientAlipayId}',
                            width: 300.w,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextView(
                    text: 'Status: ${widget.datum?.status}'.capitalize(),
                    fontSize: 20.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextView(
                    text:
                        'Amount: ${getAllCurrency('CNY')}${oCcy.format(double.parse(widget.datum?.amount ?? '0.0'))}',
                    fontSize: 24.sp,
                    color: AppColor.black,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 'wallet',
                        groupValue: _radioValue,
                        onChanged: (v) {
                          radioButtonChanges(v!);
                        },
                      ),
                      TextView(
                        text: "Wallet Address",
                        fontSize: 15.6.sp,
                      ),
                      const Spacer(),
                      Radio(
                        value: 'upload',
                        groupValue: _radioValue,
                        onChanged: (v) {
                          radioButtonChanges(v!);
                        },
                      ),
                      TextView(
                        text: "Upload Image",
                        fontSize: 15.6.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  choice == 'wallet'
                      ? TextFormWidget(
                          label: 'Alipay Wallet Id',
                          hint: 'Recipient\'s Wallet Address',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.white,
                          controller: recipientWalletIdController,
                          validator: AppValidator.validateString(),
                          onChange: (p0) {
                            // model.onGetUserWalletRate(context, p0);
                          })
                      : choice == 'upload'
                          ? SizedBox(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () => model
                                            .getDocumentAlipayImage(context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(AppImage.cal),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            TextView(
                                              text: 'Upload File',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: AppColor.darkGrey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  model.filename != null
                                      ? Container(
                                          padding: EdgeInsets.all(6.w),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.inGrey),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(AppImage.pdf),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                width: 230.w,
                                                child: TextView(
                                                  text: model.filename!,
                                                  fontSize: 14.sp,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.darkGrey,
                                                ),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                  SizedBox(
                    height: 50.h,
                  ),
                  model.isLoading
                      ? Center(
                          child: SpinKitRing(
                          color: AppColor.primary,
                          size: 44.sp,
                        ))
                      : widget.datum?.status?.toLowerCase() == "completed"
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
                                        onTap: () => model
                                            .modalBottomApproveReceiptsSheet(
                                          context: context,
                                          id: widget.datum?.id.toString(),
                                          choice: choice,
                                          recipientWalletIdController: widget
                                                      .datum !=
                                                  null
                                              ? TextEditingController(
                                                  text: widget.datum
                                                          ?.recipientAlipayId ??
                                                      "")
                                              : recipientWalletIdController,
                                          datum: widget.datum,
                                        ),
                                        child: Container(
                                            padding:
                                                EdgeInsetsDirectional.symmetric(
                                                    horizontal: 13.2.w,
                                                    vertical: 10.w),
                                            decoration: BoxDecoration(
                                                color: AppColor.green,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
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
                                        onTap: () =>
                                            model.modalBottomRejectReceiptSheet(
                                                context: context,
                                                id: widget.datum?.id
                                                    .toString()),
                                        child: Container(
                                            padding:
                                                EdgeInsetsDirectional.symmetric(
                                                    horizontal: 20.0.w,
                                                    vertical: 10.w),
                                            decoration: BoxDecoration(
                                                color: AppColor.red,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
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
            );
          }),
    );
  }

  String? _radioValue;
  //Initial definition of radio button value
  String? choice = '';

  radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'wallet':
          choice = value;
          break;
        case 'upload':
          choice = value;
          break;
        default:
          choice = "";
      }
      debugPrint(choice); //Debug the choice in console
    });
  }
}
