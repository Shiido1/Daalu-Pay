import 'dart:io';

import '../../../../core/connect_end/model/get_users_receipt_response_model/datum.dart'
    as r;
import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/app_assets/contant.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/button_widget.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/approve_receipt_entity_model.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/datum.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_all_user_response_model/datum.dart' as user;
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/get_users_receipt_response_model/get_users_receipt_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../repo/repo_impl.dart';
import "package:collection/collection.dart";

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingReceipts => _isLoadingReceipts;
  bool _isLoadingReceipts = false;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;
  DateTime now = DateTime.now();

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  LoginResponseModel? _loginResponse;
  LoginResponseModel? get loginResponse => _loginResponse;
  GetAllUserResponseModel? _allUserResponseModel;
  GetAllUserResponseModel? get allUserResponseModel => _allUserResponseModel;
  GetAdminStatsResponseModel? _adminStatsResponseModel;
  GetAdminStatsResponseModel? get adminStatsResponseModel =>
      _adminStatsResponseModel;
  GetAdminTransactionsResponseModel? _adminTransactionsResponseModel;
  GetAdminTransactionsResponseModel? get adminTransactionsResponseModel =>
      _adminTransactionsResponseModel;
  var groupedValue;

  GlobalKey<FormState> susFormkey = GlobalKey<FormState>();

  List<Datum>? transactionListData = [];
  List<user.Datum>? userListData = [];
  String transStats = 'all';
  String userStats = 'all';

  TextEditingController usernameController = TextEditingController();
  TextEditingController rejectController = TextEditingController();
  TextEditingController deleteController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController controller = TextEditingController();

  List<Datum> app = [];
  List<Datum> rej = [];
  List<Datum> pend = [];
  String query = '';

  GetUsersReceiptResponseModel? _getUsersReceiptResponseModel;
  GetUsersReceiptResponseModel? get getUsersReceiptResponseMode =>
      _getUsersReceiptResponseModel;
  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;

  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void getDocumentAlipayImage(BuildContext context) {
    try {
      _pickImage.pickImage(
          context: context,
          file: (file) {
            image = file;
            filename = image!.path.split("/").last;
            postToCloudinary(context,
                postCloudinary: PostUserCloudEntityModel(
                    file: MultipartFile.fromBytes(
                        formartFileImage(image).readAsBytesSync(),
                        filename: image!.path.split("/").last),
                    uploadPreset: 'daalupay.staging.alipay',
                    apiKey: '163312741323182'));
            notifyListeners();
          });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> postToCloudinary(
    context, {
    PostUserCloudEntityModel? postCloudinary,
  }) async {
    try {
      _isLoading = true;
      _postUserVerificationCloudResponse = await runBusyFuture(
          repositoryImply.postCloudinary(postCloudinary!),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  // login flow so api call for method can be called here

  Future<void> loginUser(LoginEntityModel loginEntity, contxt) async {
    try {
      _isLoading = true;
      _loginResponse = await runBusyFuture(repositoryImply.login(loginEntity),
          throwException: true);

      if (_loginResponse?.status == 'success') {
        _isLoading = false;
        await AppUtils.snackbar(contxt,
            message: _loginResponse?.message!.toString());
        navigate.navigateTo(Routes.adminDashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  contRecentTranWidget(user.Datum u) => Column(
        children: [
          Divider(
            color: AppColor.grey,
            thickness: .3.sp,
          ),
          SizedBox(
            height: 4.2.h,
          ),
          paddedWing(
            value: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: '${u.id}',
                  fontSize: 14.sp,
                  color: AppColor.greyNice,
                  fontWeight: FontWeight.w500,
                ),
                // TextView(
                //   text: '${getAllCurrency(u.)}${oCcy.format(double.parse(u..fromAmount!))}',
                //   fontSize: 14.sp,
                //   color: AppColor.black,
                //   fontWeight: FontWeight.w500,
                // ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 6.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.green.withOpacity(.2)),
                  child: TextView(
                    text: 'Approved',
                    fontSize: 12.sp,
                    color: AppColor.deeperGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: '99/99/2025',
                  fontSize: 12.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      );

  Future openDialog(
          {required BuildContext context, required user.Datum data}) =>
      showDialog(
        context: context,
        builder: (context) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 100.w),
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: Scaffold(
            backgroundColor: AppColor.transparent,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 33.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddedWing(
                    value: 20,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.navyBlueGrey),
                      child: TextView(
                        text: getInitials('${data.firstName} ${data.lastName}'),
                        fontSize: 16.4.sp,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.status}'.capitalize(),
                      fontSize: 14.4.sp,
                      color: AppColor.deeperGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text:
                          'Last Active - ${DateFormat('yyyy MMM dd, hh:mm a').format(DateTime.parse(data.updatedAt.toString()))}',
                      fontSize: 14.4.sp,
                      color: AppColor.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.firstName} ${data.lastName}',
                      fontSize: 15.4.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: '${data.email}'.toLowerCase(),
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 6.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextView(
                      text: 'ID-: ${data.id}'.toUpperCase(),
                      fontSize: 14.sp,
                      color: AppColor.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  paddedWing(
                      value: 20,
                      child: data.kyc?.documentImage == null
                          ? TextView(
                              text: 'file-: ${data.kyc?.documentImage}'
                                  .capitalize(),
                              fontSize: 14.sp,
                              color: AppColor.black,
                              fontWeight: FontWeight.w400,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://res.cloudinary.com/walexbiz/image/upload/f_auto,q_auto/${data.kyc?.documentImage}',
                                width: double.infinity,
                                height: 150.h,
                                fit: BoxFit.cover,
                              ),
                            )),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 12.2.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: TextFormWidget(
                      label: 'Add Notes',
                      hint: null,
                      border: 10,
                      maxline: 2,
                      isFilled: true,
                      fillColor: AppColor.white,
                      alignLabelWithHint: true,
                      controller: controller,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  paddedWing(
                    value: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => approveUser(context, id: data.id),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.w, horizontal: 22.w),
                            decoration: BoxDecoration(
                                color: AppColor.green.withOpacity(.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.flag,
                                  color: AppColor.green,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Approve',
                                  fontSize: 14.sp,
                                  color: AppColor.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => denyUser(context, id: data.id),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.w, horizontal: 22.w),
                            decoration: BoxDecoration(
                                color: AppColor.red.withOpacity(.2),
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.pause_circle_outline,
                                  color: AppColor.red,
                                  size: 24.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                TextView(
                                  text: 'Reject',
                                  fontSize: 14.sp,
                                  color: AppColor.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  // get all users flow api

  Future<void> getAllUser(contxt) async {
    try {
      _isLoading = true;
      _allUserResponseModel = await runBusyFuture(repositoryImply.getAllUsers(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAdminTransactions(contxt) async {
    try {
      _isLoading = true;
      _adminTransactionsResponseModel = await runBusyFuture(
          repositoryImply.getTransactions(),
          throwException: true);
      groupTransationStatus();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAdminStats(contxt) async {
    try {
      _isLoading = true;
      _adminStatsResponseModel = await runBusyFuture(
          repositoryImply.getAdminStats(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  groupTransationStatus() {
    app.clear();
    rej.clear();
    pend.clear();
    for (var element in _adminTransactionsResponseModel!.data!) {
      if (element.status == 'approved') {
        app.add(element);
      } else if (element.status == 'rejected') {
        rej.add(element);
      } else if (element.status == 'pending') {
        pend.add(element);
      }
      notifyListeners();
    }
    notifyListeners();
  }

  secgroupTransationStatus() {
    var groupedValue;

    groupedValue =
        groupBy(_adminTransactionsResponseModel!.data!, (obj) => obj.status);
    transactionListData!.clear();
    if (transStats == 'approved') {
      transactionListData?.addAll(groupedValue['approved']);
    } else if (transStats == 'pending') {
      transactionListData?.addAll(groupedValue['pending']);
    } else if (transStats == 'rejected') {
      transactionListData?.addAll(groupedValue['rejected']);
    } else {
      transactionListData!.clear();
    }
    notifyListeners();
  }

  usergroupTransationStatus() {
    var groupedValue;

    groupedValue = groupBy(_allUserResponseModel!.data!, (obj) => obj.status);
    userListData!.clear();
    if (userStats == 'active') {
      if (groupedValue['active'] != null) {
        userListData!.addAll(groupedValue['active']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'suspended') {
      if (groupedValue['suspended'] != null) {
        userListData!.addAll(groupedValue['suspended']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'band') {
      if (groupedValue['band'] != null) {
        userListData!.addAll(groupedValue['band']);
      } else {
        userListData!.clear();
      }
    } else if (userStats == 'unverified') {
      if (groupedValue['unverified'] != null) {
        userListData!.addAll(groupedValue['unverified']);
      } else {
        userListData!.clear();
      }
    } else {
      userListData!.clear();
    }
    notifyListeners();
  }

  void modalBottomApproveSheet({context, String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Center(
                                child: TextView(
                                  text: 'Accept Transaction',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to approve this transaction? The user will receive the funds in their wallet.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: ButtonWidget(
                                  buttonText: 'Approve Transaction',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoading,
                                  buttonColor: AppColor.primary,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () =>
                                      approveTransaction(context, id: id)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text:
                                        'This action will credit the user’s wallet',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomApproveReceiptsSheet(
      {context,
      String? id,
      String? choice,
      TextEditingController? recipientWalletIdController,
      r.Datum? datum}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Center(
                                child: TextView(
                                  text: 'Approve Receipts',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to approve this user\'s receipt? The user\'s CNY wallet will be credited.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: ButtonWidget(
                                  buttonText: 'Approve Receipts',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoadingReceipts,
                                  buttonColor: AppColor.primary,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () {
                                    approveReceipts(context,
                                        id: id,
                                        approve: ApproveReceiptEntityModel(
                                          amount: datum?.amount,
                                          recipientAddress:
                                              recipientWalletIdController?.text,
                                          currency: 'CNY',
                                          createdAt: now.toString(),
                                          updatedAt: now.toString(),
                                          status: 'approved',
                                          documentType: choice == 'wallet'
                                              ? 'alipay_id'
                                              : 'barcode',
                                          proofOfPayment: choice == 'wallet'
                                              ? recipientWalletIdController!
                                                  .text
                                              : '${model.postUserVerificationCloudResponse?.publicId}.${model.postUserVerificationCloudResponse?.format}',
                                        ));
                                    notifyListeners();
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 24.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text:
                                        'This action will credit the user’s wallet',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomSuspendAndUnsuspendSheet(
      {context, String? id, String? status}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Form(
                          key: susFormkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: Center(
                                  child: TextView(
                                    text: status?.toLowerCase() == 'active'
                                        ? 'Suspend User'
                                        : 'Unsuspend User',
                                    fontSize: 15.4.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Divider(
                                color: AppColor.inGrey,
                                thickness: .5.r,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: TextView(
                                  text: status?.toLowerCase() == 'active'
                                      ? 'Kindly provide a reason for suspending this user.'
                                      : 'Kindly provide a reason for unsuspending this user.',
                                  fontSize: 13.8.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: TextFormWidget(
                                  label: 'Reason',
                                  alignLabelWithHint: true,
                                  border: 10,
                                  isFilled: true,
                                  maxline: 3,
                                  fillColor: AppColor.white,
                                  controller: reasonController,
                                  validator: AppValidator.validateString(),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              paddedWing(
                                value: 20.w,
                                child: ButtonWidget(
                                    buttonText:
                                        status?.toLowerCase() == 'active'
                                            ? 'Suspend User'
                                            : 'Unsuspend User',
                                    color: AppColor.white,
                                    border: 8,
                                    isLoading: model.isLoading,
                                    buttonColor: AppColor.red,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () {
                                      if (susFormkey.currentState!.validate()) {
                                        status?.toLowerCase() == 'active'
                                            ? suspendUser(context,
                                                id: id,
                                                text: reasonController.text)
                                            : unSuspendUser(context,
                                                id: id,
                                                text: reasonController.text);
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomDeleteUserSheet(context, {String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 300.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: 'Delete User',
                                  fontSize: 15.4.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextView(
                                text:
                                    'Kindly provide a reason for deleting this user.',
                                fontSize: 13.8.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label: 'Reason',
                                alignLabelWithHint: true,
                                border: 10,
                                isFilled: true,
                                maxline: 3,
                                fillColor: AppColor.white,
                                controller: deleteController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: ButtonWidget(
                                  buttonText: 'Delete User',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () => deleteUser(context, id: id)),
                            ),
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomRejectSheet({context, String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 400.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: 'Reject Transaction',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to reject this transaction? The user will be notified.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label:
                                    'Provide a reason for rejection (Option)',
                                alignLabelWithHint: true,
                                isFilled: true,
                                maxline: 5,
                                fillColor: AppColor.white,
                                controller: rejectController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: ButtonWidget(
                                  buttonText: 'Reject Transaction',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoading,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () =>
                                      denyTransaction(context, id: id)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text: 'This action connot be undone',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  void modalBottomRejectReceiptSheet({context, String? id}) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => locator<AuthViewModel>(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 400.0,
                  decoration: const BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14.0),
                          topRight: Radius.circular(14.0))),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14.0),
                              topRight: Radius.circular(14.0))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Center(
                                child: TextView(
                                  text: 'Reject Receipt',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColor.inGrey,
                              thickness: .5.r,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextView(
                                text:
                                    'Are you sure you want to reject this receipt? The user will be notified.',
                                fontSize: 12.8.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: TextFormWidget(
                                label:
                                    'Provide a reason for rejection (Option)',
                                alignLabelWithHint: true,
                                isFilled: true,
                                maxline: 5,
                                fillColor: AppColor.white,
                                controller: rejectController,
                                validator: AppValidator.validateString(),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: ButtonWidget(
                                  buttonText: 'Reject Receipt',
                                  color: AppColor.white,
                                  border: 8,
                                  isLoading: model.isLoadingReceipts,
                                  buttonColor: AppColor.red,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () => denyReceipts(context,
                                      id: id, reason: rejectController.text)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            paddedWing(
                              value: 20.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppColor.yellow,
                                    size: 30.sp,
                                  ),
                                  SizedBox(
                                    width: 22.w,
                                  ),
                                  TextView(
                                    text: 'This action connot be undone',
                                    fontSize: 14.2.sp,
                                    color: AppColor.yellow,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              });
        });
  }

  Future<void> approveUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.approveUser(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;

      getAllUser(context);
      AppUtils.snackbar(contxt, message: res['message'].toString());
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.denyUser(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      rejectController.text = '';

      AppUtils.snackbar(contxt, message: res['message'].toString());
      getAllUser(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> suspendUser(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(
          repositoryImply.suspendUser(id: id, text: text),
          throwException: true);
      logger.d(res);
      reasonController.text = '';
      _isLoading = false;
      getAllUser(contxt);

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> unSuspendUser(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(
          repositoryImply.unsuspendUser(id: id, text: text),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      getAllUser(contxt);
      reasonController.text = '';

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.delete(id!),
          throwException: true);
      logger.d(res);
      getAllUser(contxt);
      _isLoading = false;

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> approveTransaction(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.approveTransaction(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      getAdminTransactions(contxt);

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyTransaction(contxt, {String? id, String? text}) async {
    try {
      _isLoading = true;
      await runBusyFuture(repositoryImply.denyTransaction(id: id, text: text),
          throwException: true);
      _isLoading = false;
      rejectController.text = '';
      getAdminTransactions(contxt);
      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getUsersReceipt(contxt) async {
    try {
      _isLoading = true;
      _getUsersReceiptResponseModel = await runBusyFuture(
          repositoryImply.getUsersReceipts(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getUsersReceiptAgain(contxt) async {
    try {
      // _isLoading = true;
      _getUsersReceiptResponseModel = await runBusyFuture(
          repositoryImply.getUsersReceipts(),
          throwException: true);
      // _isLoading = false;
    } catch (e) {
      // _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> approveReceipts(contxt,
      {String? id, ApproveReceiptEntityModel? approve}) async {
    try {
      _isLoadingReceipts = true;
      var res = await runBusyFuture(
          repositoryImply.approveReceipts(id: id, approve: approve),
          throwException: true);
      if (res['status'] == 'success') {
        AppUtils.snackbar(
          contxt,
          message: 'Users receipts has been approved.',
        );

        getUsersReceiptAgain(contxt);

        filename = '';
      }

      _isLoadingReceipts = false;
    } catch (e) {
      _isLoadingReceipts = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> denyReceipts(contxt, {String? id, String? reason}) async {
    try {
      _isLoadingReceipts = true;
      var v = await runBusyFuture(
          repositoryImply.denyReceipts(
            id: id,
            reason: reason,
          ),
          throwException: true);
      if (v['status'] == 'success') {
        AppUtils.snackbar(
          contxt,
          message: 'Users receipts has been denied.',
        );
        getUsersReceiptAgain(contxt);
      }
      _isLoadingReceipts = false;
    } catch (e) {
      _isLoadingReceipts = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
