import 'dart:io';
import 'dart:async';

import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/user_response_model/user_response_model.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/country_const.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
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

  bool get isLoading => _isLoading;
  bool _isLoading = false;

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

  TextEditingController dobController = TextEditingController();

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

  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;

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

  String fromCurrency = AppImage.nigeria_flag;
  String toCurrency = AppImage.united_states;
  String fromCurrencyCode = 'NGN';
  String toCurrencyCode = 'USD';

  TextEditingController fromCurrencylController =
      TextEditingController(text: '1');
  TextEditingController toCurrencylController =
      TextEditingController(text: '1');
  final debouncer = Debouncer();
  TextEditingController curcodeFromController = TextEditingController();
  TextEditingController curcodeToController = TextEditingController();
  String queryFrom = '';
  String queryTo = '';

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
                                                          TextView(
                                                            text:
                                                                '${e['country']}',
                                                            fontSize: 17.6,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                              TextView(
                                                                text:
                                                                    '${e['country']}',
                                                                fontSize: 17.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                                          TextView(
                                                            text:
                                                                '${e['country']}',
                                                            fontSize: 17.6,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                                              TextView(
                                                                text:
                                                                    '${e['country']}',
                                                                fontSize: 17.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
    double fee =
        (double.parse(fromCurrencylController.text) * 0.01 * 100) / 100;
    return fee.toString();
  }
}
