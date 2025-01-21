import 'dart:io';
import 'dart:async';
import "package:collection/collection.dart";
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/user_response_model/user_response_model.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_max/flutter_paystack_max.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/country_const.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/button_widget.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
import '../model/get_transaction_response_model/datum.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/register_entity_model.dart';
import '../repo/repo_impl.dart';
import 'debouncer.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();

  AuthViewModel({this.context});

  bool get is8characters => _is8characters;
  bool _is8characters = false;
  bool get isUpperCase => _isUpperCase;
  bool _isUpperCase = false;
  bool get isLowerCase => _isLowerCase;
  bool _isLowerCase = false;
  bool get isSpecialCharacters => _isSpecialCharacters;
  bool _isSpecialCharacters = false;
  bool get isNumber => _isNumber;
  bool _isNumber = false;

  bool _isDisabled = true;
  bool get disabled => _isDisabled;

  bool? _isToggleNewPassword = false;
  bool? _isTogglePasswordConfirm = false;

  bool? get isToggleNewPassword => _isToggleNewPassword;
  bool? get isTogglePasswordConfirm => _isTogglePasswordConfirm;

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  bool get isLoadingCreate => _isLoadingCreate;
  bool _isLoadingCreate = false;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  GetExchangeRateResponseModel? get exchangeRateResponseModel =>
      _exchangeRateResponseModel;
  GetExchangeRateResponseModel? _exchangeRateResponseModel;

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  LoginResponseModel? _loginResponse;
  LoginResponseModel? get loginResponse => _loginResponse;
  RegistrationResponseModel? _registrationResponseModel;
  RegistrationResponseModel? get registrationResponseModel =>
      _registrationResponseModel;
  UserResponseModel? _userResponseModel;
  UserResponseModel? get userResponseModel => _userResponseModel;
  GetStatsResponseModel? _getStatsResponseModel;
  GetStatsResponseModel? get getStatsResponseModel => _getStatsResponseModel;
  GetTransactionResponseModel? _getTransactionResponseModel;
  GetTransactionResponseModel? get getTransactionResponseModel =>
      _getTransactionResponseModel;
  UpdatePasswordResponseModel? get updatePasswordResponseModel =>
      _updatePasswordResponseModel;
  UpdatePasswordResponseModel? _updatePasswordResponseModel;
  TextEditingController dobController = TextEditingController();
  List<Datum>? transactionListData = [];

  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;

  String fromCurrency = AppImage.nigeria_flag;
  String toCurrency = AppImage.united_states;
  String fromCurrencyCode = 'NGN';
  String toCurrencyCode = 'USD';
  String createCurrencyCode = '';

  TextEditingController fromCurrencylController =
      TextEditingController(text: '1');
  TextEditingController toCurrencylController =
      TextEditingController(text: '1');
  final debouncer = Debouncer();
  TextEditingController curcodeFromController = TextEditingController();
  TextEditingController curcodeToController = TextEditingController();
  String queryFrom = '';
  String queryTo = '';
  String queryCreate = '';
  String? selectCountry;

  String transStats = 'all';
  bool initializingPayment = false;

  DateTime selectedDOB = DateTime.now();

  String? _formattedDob = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());

  Future<void> selectDateOfBirth(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: selectedDOB,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDOB) {
      selectedDOB = picked;
      _formattedDob = DateFormat('dd-MM-yyyy').format(selectedDOB);

      dobController.text = _formattedDob!;
      notifyListeners();
    }
  }

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void getDocumentImage(BuildContext context) {
    try {
      _pickImage.pickImage(
          context: context,
          file: (file) {
            image = file;
            filename = image!.path.split("/").last;
            print(filename);
            notifyListeners();
          });
    } catch (e) {
      logger.e(e);
    }
  }

  // register flow
  Future<void> register(RegisterEntityModel registerEntity, contxt) async {
    try {
      _isLoading = true;
      _registrationResponseModel = await runBusyFuture(
          repositoryImply.register(registerEntity),
          throwException: true);

      if (_registrationResponseModel?.status == 'success') {
        _isLoading = false;
        AppUtils.snackbar(contxt,
            message: 'Registration is successfully', error: true);
        navigate.navigateTo(Routes.loginScreen);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
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
        navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  // user data api call

  Future<void> getUser(contxt) async {
    try {
      _isLoading = true;
      _userResponseModel =
          await runBusyFuture(repositoryImply.userData(), throwException: true);

      if (_userResponseModel?.status == 'success') {
        _isLoading = false;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  // get user statistics data api call

  Future<void> getStatistics(contxt) async {
    try {
      _isLoading = true;
      _getStatsResponseModel = await runBusyFuture(
          repositoryImply.getStatistics(),
          throwException: true);

      if (_getStatsResponseModel?.status == 'success') {
        _isLoading = false;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  // get user transaction data api call

  Future<void> getTransaction(contxt) async {
    try {
      _isLoading = true;
      _getTransactionResponseModel = await runBusyFuture(
          repositoryImply.getTransactions(),
          throwException: true);

      if (_getTransactionResponseModel?.status == 'success') {
        _isLoading = false;
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  groupTransationStatus() {
    var groupedValue;

    groupedValue =
        groupBy(_getTransactionResponseModel!.data!, (obj) => obj.status);
    transactionListData!.clear();
    print('object::::$groupedValue');
    if (transStats == 'successful') {
      transactionListData?.addAll(groupedValue['completed']);
    } else if (transStats == 'pending') {
      transactionListData?.addAll(groupedValue['pending']);
    } else if (transStats == 'failed') {
      transactionListData?.addAll(groupedValue['failed']);
    } else {
      transactionListData!.clear();
    }
    notifyListeners();
  }

  // get exchange rate

  Future<void> exchangeRates(contxt, {String? from, String? to}) async {
    try {
      _exchangeRateResponseModel = await runBusyFuture(
          repositoryImply.exchangeRate(from: from, to: to),
          throwException: true);

      if (_exchangeRateResponseModel?.status == 'success') {
        _isLoading = false;
      }
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  exchangeTheRate(o) {
    toCurrencylController.text =
        (double.parse(_exchangeRateResponseModel!.data!.rate!) *
                double.parse(o))
            .toString();

    notifyListeners();
  }

  void modalBottomSheetMenuFrom(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(219, 223, 233, 242),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14.0),
                          topRight: const Radius.circular(14.0))),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(219, 223, 233, 242),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(14.0),
                              topRight: const Radius.circular(14.0))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: TextFormWidget(
                              label: 'Search country',
                              hint: '',
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,

                              onChange: (p0) {
                                queryFrom = p0;
                                model.notifyListeners();
                              },
                              suffixIcon: Icons.search_sharp,
                              controller: curcodeFromController,
                              // validator: AppValidator.validateAmount(),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    queryFrom == ''
                                        ? Column(
                                            children: [
                                              ...countryConst.map((e) =>
                                                  GestureDetector(
                                                    onTap: () {
                                                      fromCurrency = e['flag']!;
                                                      fromCurrencyCode =
                                                          e['code']!;
                                                      Navigator.pop(context);
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            219, 223, 233, 242),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              e['flag']!),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          SizedBox(
                                                            width: 180.w,
                                                            child: TextView(
                                                              text:
                                                                  '${e['country']}',
                                                              fontSize: 17.6,
                                                              maxLines: 1,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              ...countryConst
                                                  .where((o) => o['country']!
                                                      .toLowerCase()
                                                      .contains(queryFrom
                                                          .toLowerCase()))
                                                  .map((e) => GestureDetector(
                                                        onTap: () {
                                                          fromCurrency =
                                                              e['flag']!;
                                                          fromCurrencyCode =
                                                              e['code']!;

                                                          Navigator.pop(
                                                              context);
                                                          notifyListeners();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                .fromARGB(219,
                                                                223, 233, 242),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.w,
                                                                  horizontal:
                                                                      20.w),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  e['flag']!),
                                                              SizedBox(
                                                                width: 15.6.w,
                                                              ),
                                                              SizedBox(
                                                                width: 180.w,
                                                                child: TextView(
                                                                  text:
                                                                      '${e['country']}',
                                                                  fontSize:
                                                                      17.6,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                            ],
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      )),
                );
              });
        });
  }

  void modalBottomSheetMenuTo(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(219, 223, 233, 242),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14.0),
                          topRight: const Radius.circular(14.0))),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(219, 223, 233, 242),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(14.0),
                              topRight: const Radius.circular(14.0))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: TextFormWidget(
                              label: 'Search country',
                              hint: '',
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,

                              onChange: (p0) {
                                queryTo = p0;
                                model.notifyListeners();
                              },
                              suffixIcon: Icons.search_sharp,
                              controller: curcodeToController,
                              // validator: AppValidator.validateAmount(),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 400,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    queryTo == ''
                                        ? Column(
                                            children: [
                                              ...countryConst.map((e) =>
                                                  GestureDetector(
                                                    onTap: () {
                                                      toCurrency = e['flag']!;
                                                      toCurrencyCode =
                                                          e['code']!;
                                                      Navigator.pop(context);
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            219, 223, 233, 242),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              e['flag']!),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          SizedBox(
                                                            width: 180.w,
                                                            child: TextView(
                                                              text:
                                                                  '${e['country']}',
                                                              fontSize: 17.6,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              ...countryConst
                                                  .where((o) => o['country']!
                                                      .toLowerCase()
                                                      .contains(queryTo
                                                          .toLowerCase()))
                                                  .map((e) => GestureDetector(
                                                        onTap: () {
                                                          toCurrency =
                                                              e['flag']!;
                                                          toCurrencyCode =
                                                              e['code']!;
                                                          Navigator.pop(
                                                              context);
                                                          notifyListeners();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                .fromARGB(219,
                                                                223, 233, 242),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.w,
                                                                  horizontal:
                                                                      20.w),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  e['flag']!),
                                                              SizedBox(
                                                                width: 15.6.w,
                                                              ),
                                                              SizedBox(
                                                                width: 180.w,
                                                                child: TextView(
                                                                  text:
                                                                      '${e['country']}',
                                                                  fontSize:
                                                                      17.6,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                            ],
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                );
              });
        });
  }

  void modalBottomSheetMenuCreateWallet(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(219, 223, 233, 242),
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(14.0),
                          topRight: const Radius.circular(14.0))),
                  child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(219, 223, 233, 242),
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(14.0),
                              topRight: const Radius.circular(14.0))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: TextFormWidget(
                              label: 'Search country',
                              hint: '',
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              onChange: (p0) {
                                queryCreate = p0;
                                model.notifyListeners();
                              },
                              suffixIcon: Icons.search_sharp,
                              controller: curcodeToController,
                              // validator: AppValidator.validateAmount(),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 340,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    queryCreate == ''
                                        ? SizedBox(
                                            width: 400.w,
                                            child: Column(
                                              children: [
                                                ...countryConst.map((e) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        createCurrencyCode =
                                                            e['code']!;
                                                        selectCountry =
                                                            e['code'];
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(219,
                                                              223, 233, 242),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4.6.w,
                                                                horizontal:
                                                                    10.w),
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.w),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: selectCountry ==
                                                                      e['code']
                                                                  ? AppColor
                                                                      .white
                                                                  : AppColor
                                                                      .transparent),
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                  e['flag']!),
                                                              SizedBox(
                                                                width: 15.6.w,
                                                              ),
                                                              SizedBox(
                                                                width: 180.w,
                                                                child: TextView(
                                                                  text:
                                                                      '${e['country']}',
                                                                  fontSize:
                                                                      17.6,
                                                                  maxLines: 1,
                                                                  textOverflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              ...countryConst
                                                  .where((o) => o['country']!
                                                      .toLowerCase()
                                                      .contains(queryCreate
                                                          .toLowerCase()))
                                                  .map((e) => GestureDetector(
                                                        onTap: () {
                                                          createCurrencyCode =
                                                              e['code']!;

                                                          selectCountry =
                                                              e['code'];
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color
                                                                .fromARGB(219,
                                                                223, 233, 242),
                                                          ),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      4.6.w,
                                                                  horizontal:
                                                                      10.w),
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    6.w),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: selectCountry ==
                                                                        e[
                                                                            'code']
                                                                    ? AppColor
                                                                        .white
                                                                    : AppColor
                                                                        .transparent),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    e['flag']!),
                                                                SizedBox(
                                                                  width: 15.6.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 180.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        '${e['country']}',
                                                                    fontSize:
                                                                        17.6,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    maxLines: 1,
                                                                    textOverflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ))
                                            ],
                                          ),
                                    SizedBox(
                                      height: 14.0.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: ButtonWidget(
                                buttonText: 'Create Wallet',
                                color: AppColor.white,
                                border: 8,
                                isLoading: model.isLoadingCreate,
                                buttonColor: AppColor.primary,
                                buttonBorderColor: Colors.transparent,
                                onPressed: () {
                                  if (createCurrencyCode != '') {
                                    createWallet(context,
                                        currencyCode: createCurrencyCode);
                                  } else {
                                    AppUtils.snackbar(context,
                                        message:
                                            'Select country for currency code');
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      )),
                );
              });
        });
  }

  void onChangeRate(p0) {
    debouncer.run(() => exchangeTheRate(p0));
    notifyListeners();
  }

  String getWalletCurrencyCode(currencyCode) {
    String flag = '';
    countryConst.forEach(
      (element) {
        if (element.containsValue(currencyCode)) {
          flag = element['flag']!;
        }
      },
    );
    return flag;
  }

  String getWalletCountry(currencyCode) {
    String country = '';
    countryConst.forEach(
      (element) {
        if (element.containsValue(currencyCode)) {
          country = '${element['name']!} ($currencyCode)';
        }
      },
    );
    return country;
  }

  String transferFee() {
    double fee = fromCurrencylController.text.isNotEmpty
        ? (double.parse(fromCurrencylController.text) * 0.01 * 100) / 100
        : 0;
    return fee.toString();
  }

  Future<void> createWallet(context, {String? currencyCode}) async {
    try {
      _isLoadingCreate = true;
      await runBusyFuture(repositoryImply.createWallet(currencyCode!),
          throwException: true);
      _isLoadingCreate = false;
      getStatistics(context);
      Navigator.pop(context);
    } catch (e) {
      _isLoadingCreate = false;
      AppUtils.snackbar(context,
          message: 'This wallet may have been created already', error: true);
    }
    notifyListeners();
  }

  Future<void> swap(context, {SwapEntiyModel? swap}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.swap(swap!),
          throwException: true);
      _isLoading = false;
      if (v['status'] == true) {
        AppUtils.snackbar(context, message: v['message']);
        getStatistics(context);
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateProfile(context, {RegisterEntityModel? update}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.updateProfile(update!),
          throwException: true);
      _isLoading = false;
      if (v['status'] == 'success') {
        AppUtils.snackbar(context, message: 'Update Successful');
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updatePassword(context, {UpdatePasswordEntity? update}) async {
    try {
      _isLoading = true;
      _updatePasswordResponseModel = await runBusyFuture(
          repositoryImply.updatePassword(update!),
          throwException: true);
      _isLoading = false;
      if (_updatePasswordResponseModel?.status == 'success') {
        AppUtils.snackbar(context, message: 'Password updated Successful..!');

        navigate.navigateTo(Routes.setupScreen);
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void makePayment({amount, context}) async {
    print(session.usersData['user']);
    const secretKey = 'sk_test_d9830d6c7a17c2b69f22ccb0589b560c902f6059';

    final request = PaystackTransactionRequest(
      reference: 'ps_${DateTime.now().microsecondsSinceEpoch}',
      secretKey: secretKey,
      email: session.usersData['user']['email'],
      amount: amount * 100,
      currency: PaystackCurrency.ngn,
      channel: [
        PaystackPaymentChannel.mobileMoney,
        PaystackPaymentChannel.card,
        PaystackPaymentChannel.ussd,
        PaystackPaymentChannel.bankTransfer,
        PaystackPaymentChannel.bank,
        PaystackPaymentChannel.qr,
        PaystackPaymentChannel.eft,
      ],
    );

    initializingPayment = true;
    final initializedTransaction =
        await PaymentService.initializeTransaction(request);

    if (!initializedTransaction.status) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(initializedTransaction.message),
      ));

      return;
    }

    final response = await PaymentService.showPaymentModal(context,
            transaction: initializedTransaction,
            // Callback URL must match the one specified on your paystack dashboard,
            callbackUrl:
                'https://snappy.appypie.com/webservices/InAppPaymentGateway/paystack/response.php?method=success')
        .then((_) async {
      return await PaymentService.verifyTransaction(
        paystackSecretKey: secretKey,
        initializedTransaction.data?.reference ?? request.reference,
      );
    });

    print(response); // Result of the confirmed payment

    // await PaymentService.showPaymentModal(
    //   context,
    //   transaction: initializedTransaction,
    //   // Callback URL must match the one specified on your paystack dashboard,
    //   callbackUrl: 'https://binemmanuel.com',
    // );

    // final response = await PaymentService.verifyTransaction(
    //   paystackSecretKey: secretKey,
    //   initializedTransaction.data?.reference ?? request.reference,
    // );

    // if (kDebugMode) logger.d(response.data.status == PaystackTransactionStatus.abandoned);
  }

  isDisable() {
    _isDisabled = false;
    notifyListeners();
  }

  isNotDisable() {
    _isDisabled = true;
    notifyListeners();
  }

  bool isOnToggleNewPassword() {
    _isToggleNewPassword = !_isToggleNewPassword!;
    notifyListeners();
    return _isToggleNewPassword!;
  }

  bool isOnTogglePasswordConfirm() {
    _isTogglePasswordConfirm = !_isTogglePasswordConfirm!;
    notifyListeners();
    return _isTogglePassword;
  }

  validatePassword(String password) {
    if (password.length >= 8) {
      _is8characters = true;
    } else {
      _is8characters = false;
    }
    if (password.contains(RegExp("(?:[ ^A-Z]*[A-Z]){1}"))) {
      _isUpperCase = true;
    } else {
      _isUpperCase = false;
    }
    if (password.contains(RegExp("(?:[ ^a-z]*[a-z]){1}"))) {
      _isLowerCase = true;
    } else {
      _isLowerCase = false;
    }
    if (password.contains(RegExp(r'[0-9]'))) {
      _isNumber = true;
    } else {
      _isNumber = false;
    }
    if (password.contains(RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      _isSpecialCharacters = true;
    } else {
      _isSpecialCharacters = false;
    }
    notifyListeners();
  }
}
