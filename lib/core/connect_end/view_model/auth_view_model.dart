import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/get_admin_stats_response_model/get_admin_stats_response_model.dart';
import '../model/get_admin_transactions_response_model/datum.dart';
import '../model/get_admin_transactions_response_model/get_admin_transactions_response_model.dart';
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

  List<Datum>? transactionListData = [];
  String transStats = 'approved';

  TextEditingController usernameController = TextEditingController();

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

  searchUsername(p0) {
    usernameController.text = p0;
  }
}
