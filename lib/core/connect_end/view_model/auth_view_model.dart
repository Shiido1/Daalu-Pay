import 'package:daalu_pay_admin/ui/app_assets/app_color.dart';
import 'package:daalu_pay_admin/ui/app_assets/contant.dart';
import 'package:daalu_pay_admin/ui/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/widget/button_widget.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/datum.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
import '../model/get_all_user_response_model/datum.dart' as user;
import '../model/get_all_user_response_model/get_all_user_response_model.dart';
import '../model/login_entity_model.dart';
import '../model/login_response_model/login_response_model.dart';
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

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

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

  List<Datum> app = [];
  List<Datum> rej = [];
  List<Datum> pend = [];
  String query = '';

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
      userListData?.addAll(groupedValue['active']);
    } else if (userStats == 'suspended') {
      userListData?.addAll(groupedValue['suspended']);
    } else if (userStats == 'band') {
      userListData?.addAll(groupedValue['band']);
    } else if (userStats == 'unverified') {
      userListData?.addAll(groupedValue['unverified']);
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
                                  isLoading: isLoading,
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
                                    isLoading: isLoading,
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
                                  isLoading: isLoading,
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
                                  isLoading: _isLoading,
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

  Future<void> approveUser(contxt, {String? id}) async {
    try {
      _isLoading = true;
      var res = await runBusyFuture(repositoryImply.approveUser(id!),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      Navigator.pop(contxt);
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

      Navigator.pop(contxt);
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
      var res = await runBusyFuture(
          repositoryImply.denyTransaction(id: id, text: text),
          throwException: true);
      logger.d(res);
      _isLoading = false;
      rejectController.text = '';

      Navigator.pop(contxt);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
