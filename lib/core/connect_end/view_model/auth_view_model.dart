import 'dart:io';
import 'dart:async';
import "package:collection/collection.dart";
import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_response_model/deposit_wallet_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_exchange_rate_response_model/get_exchange_rate_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_transaction_response_model/get_transaction_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_wallet_id_response_model/get_wallet_id_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_entity_model/kyc_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/kyc_response_model/kyc_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/notification_user_response_model/notification_user_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/post_user_cloud_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/registration_response_model/registration_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/reset_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/send_message_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/swap_entiy_model.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_entity/update_password_entity.dart';
import 'package:daalu_pay/core/connect_end/model/update_password_response_model/update_password_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/user_response_model/user_response_model.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';
import 'package:intl/intl.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
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
import '../model/get_message_response/get_message_response.dart';
import '../model/get_payment_gate_response_model/get_payment_gate_response_model.dart';
import '../model/get_stats_response_model/get_stats_response_model.dart';
import '../model/get_stats_response_model/wallet.dart';
import '../model/get_swapped_transactions_response_model/get_swapped_transactions_response_model.dart';
import '../model/initiate_chat_response_model/initiate_chat_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/preference_response_model/preference_response_model.dart';
import '../model/register_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../repo/repo_impl.dart';
import '../model/get_swapped_transactions_response_model/datum.dart' as sp;
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
  bool get isSignupTogglePassword => _isSignupTogglePassword;
  bool _isSignupTogglePassword = false;
  bool get isSignupConTogglePassword => _isSignupConTogglePassword;
  bool _isSignupConTogglePassword = false;

  GetExchangeRateResponseModel? get exchangeRateResponseModel =>
      _exchangeRateResponseModel;
  GetExchangeRateResponseModel? _exchangeRateResponseModel;

  DepositWalletResponseModel? _depositWalletResponseModel;
  DepositWalletResponseModel? get depositWalletResponse =>
      _depositWalletResponseModel;
  KycResponseModel? get kycResponseModel => _kycResponseModel;
  KycResponseModel? _kycResponseModel;

  GetPaymentGateResponseModel? _paymentGateResponseModel;
  GetPaymentGateResponseModel? get paymentGateResponseModel =>
      _paymentGateResponseModel;

  // firebase generate token call

  final _firebaseMessage = FirebaseMessaging.instance;

  int currentPageWallet = 0;

  buildCarouselIndicator() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < getStatsResponseModel!.data!.wallets!.length; i++)
            Container(
              margin: EdgeInsets.all(5.w),
              height: i == currentPageWallet ? 10 : 9.2.h,
              width: i == currentPageWallet ? 10 : 9.2.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.grey,
                  ),
                  color: i == currentPageWallet
                      ? AppColor.primary
                      : AppColor.white,
                  shape: BoxShape.circle),
            )
        ],
      ),
    );
  }

  Future<void> initNotificationToken() async {
    await _firebaseMessage.requestPermission();
    globalfCMToken = await _firebaseMessage.getToken();
    print(":jjjj:::::$globalfCMToken");
    notifyListeners();
  }

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  bool isSignupOnTogglePassword() {
    _isSignupTogglePassword = !_isSignupTogglePassword;
    notifyListeners();
    return _isSignupTogglePassword;
  }

  bool isSignupConOnTogglePassword() {
    _isSignupConTogglePassword = !_isSignupConTogglePassword;
    notifyListeners();
    return _isSignupConTogglePassword;
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
  List<sp.Datum>? transactionListData = [];

  NotificationUserResponseModel? _notificationUserResponseModel;
  NotificationUserResponseModel? get notificationUserResponseModel =>
      _notificationUserResponseModel;
  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;

  InitiateChatResponseModel? _initiateChatResponseModel;
  InitiateChatResponseModel? get initiateChatResponseModel =>
      _initiateChatResponseModel;
  GetMessageResponse? get getMessageResponse => _getMessageResponse;
  GetMessageResponse? _getMessageResponse;
  SendMessageResponseModel? get sendMessageResponseModel =>
      _sendMessageResponseModel;
  SendMessageResponseModel? _sendMessageResponseModel;
  PreferenceResponseModel? _preferenceResponseModel;
  PreferenceResponseModel? get preferenceResponseModel =>
      _preferenceResponseModel;

  GetSwappedTransactionsResponseModel? _getSwappedTransactionsResponseModel;
  GetSwappedTransactionsResponseModel?
      get getSwappedTransactionsResponseModel =>
          _getSwappedTransactionsResponseModel;

  TextEditingController currencyController = TextEditingController();
  TextEditingController recipientWalletIdController = TextEditingController();
  Wallet? _walletAmount;
  Wallet? get walletAmount => _walletAmount;

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
  TextEditingController signUpCountryController = TextEditingController();
  String queryFrom = '';
  String queryTo = '';
  String queryCreate = '';
  String querySignUpCountry = '';
  String? selectCountry;

  String transStats = 'From';
  bool initializingPayment = false;
  GetWalletIdResponseModel? _getWalletIdResponseModel;
  GetWalletIdResponseModel? get getWalletIdResponseModel =>
      _getWalletIdResponseModel;
  DateTime selectedDOB = DateTime.now();
  String? _formattedDob = DateFormat('EEEE, d MMM yyyy').format(DateTime.now());
  Timer? timer;
  int startTimerCount = 0;
  dynamic dailyLimit;
  int transaction = 0;

  void startTimer() {
    startTimerCount = 30;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTimerCount == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          startTimerCount--;
          notifyListeners();
        }
      },
    );
  }

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

  DateTime nowFilter = DateTime.now();
  String? filterDateTime;

  Future<void> filterTransDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: nowFilter,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null && picked != nowFilter) {
      nowFilter = picked;

      filterDateTime = DateFormat('yyyy-MM-dd').format(nowFilter);

      groupTransationByDate(context);
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
            postToCloudinary(context,
                postCloudinary: PostUserCloudEntityModel(
                    file: MultipartFile.fromBytes(
                        formartFileImage(image).readAsBytesSync(),
                        filename: image!.path.split("/").last),
                    uploadPreset: 'daalupay.staging.verification',
                    apiKey: '163312741323182'));
            notifyListeners();
          });
    } catch (e) {
      logger.e(e);
    }
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
        navigate.navigateTo(Routes.verifyScreen,
            arguments: VerifyScreenArguments(email: registerEntity.email));
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
        navigate.navigateTo(Routes.dashboard,
            arguments: DashboardArguments(index: 0));
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

  groupSwapTransationByFromCur(context) {
    Map<String?, List<sp.Datum>> groupedValue;

    groupedValue = groupBy(
        _getSwappedTransactionsResponseModel!.data!, (obj) => obj.fromCurrency);
    transactionListData!.clear();
    transactionListData?.addAll(groupedValue[transStats] ?? []);
    if (transactionListData!.isEmpty) {
      AppUtils.snackbar(context,
          message: 'No $transStats transaction ', error: true);
    }
    notifyListeners();
  }

  groupTransationByDate(context) {
    Map<String?, List<sp.Datum>> groupedValue;
    groupedValue = groupBy(_getSwappedTransactionsResponseModel!.data!,
        (obj) => obj.createdAt.toString().substring(0, 10));
    transactionListData!.clear();
    transactionListData?.addAll(groupedValue[filterDateTime] ?? []);

    if (transactionListData!.isEmpty) {
      AppUtils.snackbar(context,
          message: 'No transaction made on $filterDateTime', error: true);
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

  getUSerWalletUUID(context, o) {
    recipientWalletIdController.text = o;
    getWalletId(context, id: o);

    notifyListeners();
  }

  Wallet? w;
  void modalBottomSheetMenuFrom(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                model.getStatistics(context);
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 400.0,
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
                              height: 320,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    queryFrom == ''
                                        ? Column(
                                            children: [
                                              if (model.getStatsResponseModel !=
                                                  null)
                                                ...model.getStatsResponseModel!
                                                    .data!.wallets!
                                                    .map((e) => InkResponse(
                                                          onTap: () {
                                                            w = e;
                                                            model
                                                                .notifyListeners();
                                                            fromCurrency =
                                                                getWalletCurrencyCode(
                                                                    e.currency);
                                                            fromCurrencyCode =
                                                                e.currency!;
                                                            notifyListeners();
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 1),
                                                                () {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                    vertical:
                                                                        4.w),
                                                            decoration: BoxDecoration(
                                                                color: e == w
                                                                    ? AppColor
                                                                        .white
                                                                    : AppColor
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.r)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.w,
                                                                    horizontal:
                                                                        20.w),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    getWalletCurrencyCode(
                                                                        e.currency)),
                                                                SizedBox(
                                                                  width: 15.6.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 180.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        '${e.currency}',
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
                                                        )),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              if (model.getStatsResponseModel !=
                                                  null)
                                                ...model.getStatsResponseModel!
                                                    .data!.wallets!
                                                    .where((o) => o.currency!
                                                        .toLowerCase()
                                                        .contains(queryFrom
                                                            .toLowerCase()))
                                                    .map((e) => GestureDetector(
                                                          onTap: () {
                                                            w = e;
                                                            model
                                                                .notifyListeners();
                                                            fromCurrency =
                                                                getWalletCurrencyCode(
                                                                    e.currency);
                                                            fromCurrencyCode =
                                                                e.currency!;

                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 1),
                                                                () {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            notifyListeners();
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                    vertical:
                                                                        4.w),
                                                            decoration: BoxDecoration(
                                                                color: e == w
                                                                    ? AppColor
                                                                        .white
                                                                    : AppColor
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.r)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.w,
                                                                    horizontal:
                                                                        20.w),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    getWalletCurrencyCode(
                                                                        e.currency)),
                                                                SizedBox(
                                                                  width: 15.6.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 180.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        '${e.currency}',
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
              onViewModelReady: (model) {
                model.getStatistics(context);
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Container(
                  height: 400.0,
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
                              label: 'Search country code',
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
                              height: 320,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    queryTo == ''
                                        ? Column(
                                            children: [
                                              if (model.getStatsResponseModel !=
                                                  null)
                                                ...model.getStatsResponseModel!
                                                    .data!.wallets!
                                                    .map((e) => GestureDetector(
                                                          onTap: () {
                                                            w = e;
                                                            model
                                                                .notifyListeners();
                                                            toCurrency =
                                                                getWalletCurrencyCode(
                                                                    e.currency);
                                                            toCurrencyCode =
                                                                e.currency!;
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 1),
                                                                () {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            notifyListeners();
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                    vertical:
                                                                        4.w),
                                                            decoration: BoxDecoration(
                                                                color: e == w
                                                                    ? AppColor
                                                                        .white
                                                                    : AppColor
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.r)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.w,
                                                                    horizontal:
                                                                        20.w),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    getWalletCurrencyCode(
                                                                        e.currency)),
                                                                SizedBox(
                                                                  width: 15.6.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 180.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        '${e.currency}',
                                                                    fontSize:
                                                                        17.6,
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
                                              if (model.getStatsResponseModel !=
                                                  null)
                                                ...model.getStatsResponseModel!
                                                    .data!.wallets!
                                                    .where((o) => o.currency!
                                                        .toLowerCase()
                                                        .contains(queryTo
                                                            .toLowerCase()))
                                                    .map((e) => GestureDetector(
                                                          onTap: () {
                                                            w = e;
                                                            model
                                                                .notifyListeners();
                                                            toCurrency =
                                                                getWalletCurrencyCode(
                                                                    e.currency);
                                                            toCurrencyCode =
                                                                e.currency!;
                                                            Future.delayed(
                                                                Duration(
                                                                    seconds: 1),
                                                                () {
                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                            notifyListeners();
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10.w,
                                                                    vertical:
                                                                        4.w),
                                                            decoration: BoxDecoration(
                                                                color: e == w
                                                                    ? AppColor
                                                                        .white
                                                                    : AppColor
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.r)),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.w,
                                                                    horizontal:
                                                                        20.w),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture.asset(
                                                                    getWalletCurrencyCode(
                                                                        e.currency)),
                                                                SizedBox(
                                                                  width: 15.6.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 180.w,
                                                                  child:
                                                                      TextView(
                                                                    text:
                                                                        '${e.currency}',
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

  void modalBottomSheetMenuSignUpCountry(context) {
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
                                querySignUpCountry = p0;
                                model.notifyListeners();
                              },
                              suffixIcon: Icons.search_sharp,
                              controller: signUpCountryController,
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
                                    querySignUpCountry == ''
                                        ? SizedBox(
                                            width: 400.w,
                                            child: Column(
                                              children: [
                                                ...countryConst.map((e) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        signUpCountryController
                                                                .text =
                                                            e['country']!;
                                                        selectCountry =
                                                            e['code'];
                                                        model.notifyListeners();
                                                        Navigator.pop(context);
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
                                                      .contains(
                                                          querySignUpCountry
                                                              .toLowerCase()))
                                                  .map((e) => GestureDetector(
                                                        onTap: () {
                                                          signUpCountryController
                                                                  .text =
                                                              e['country']!;

                                                          selectCountry =
                                                              e['code'];
                                                          model
                                                              .notifyListeners();

                                                          Navigator.pop(
                                                              context);
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

  void onGetUserWalletRate(context, p0) {
    debouncer.run(() => getUSerWalletUUID(context, p0));
    notifyListeners();
  }

  String getWalletCurrencyCode(currencyCode) {
    String flag = '';
    for (var element in countryConst) {
      if (element.containsValue(currencyCode)) {
        flag = element['flag']!;
      }
    }
    return flag;
  }

  String getWalletCountry(currencyCode) {
    String country = '';
    for (var element in countryConst) {
      if (element.containsValue(currencyCode)) {
        country = '${element['name']!} ($currencyCode)';
      }
    }
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

  Future<void> getSwapTransaction(context) async {
    try {
      _isLoading = true;
      _getSwappedTransactionsResponseModel =
          await runBusyFuture(repositoryImply.getSwap(), throwException: true);
      _isLoading = false;
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

  Future<void> resetPassword(context, {ResetPasswordEntity? reset}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.resetPassword(reset!),
          throwException: true);
      _isLoading = false;
      navigate.navigateTo(Routes.loginScreen);
      AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> forgotPassword(context, {String? email}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.forgotPassword(email!),
          throwException: true);
      _isLoading = false;
      navigate.navigateTo(Routes.resetPasswordScreen,
          arguments: ResetPasswordScreenArguments(email: email));
      AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> requestOtp(context, {String? email}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.requestOtp(email!),
          throwException: true);
      _isLoading = false;
      if (v['status'] == 'success') {
        AppUtils.snackbar(context, message: v['message']);
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> validateOtp(context, {String? otp, String? email}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
          repositoryImply.verifyOtp(otp: otp, email: email),
          throwException: true);
      _isLoading = false;
      if (v['status'] == 'success') {
        navigate.navigateTo(Routes.loginScreen);
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> alipayVerify(context, {AliPayEntityModel? alipay}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.alipayVerify(alipay!),
          throwException: true);
      _isLoading = false;
      if (v['status'] == 'success') {
        AppUtils.snackbar(context, message: 'Receipt sent successfully..!');
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getWalletId(context, {String? id}) async {
    try {
      _isLoading = true;
      _getWalletIdResponseModel = await runBusyFuture(
          repositoryImply.getWalletId(id!),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> sendMoney(context, {SendMonetEntityModel? sendMoney}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.sendMoney(sendMoney!),
          throwException: true);
      if (v['status'] == 'success') {
        AppUtils.snackbar(context, message: 'Transfer Successful..!');
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> depositMoney(context,
      {DepositWalletEntityModel? depositMoney}) async {
    try {
      _isLoading = true;
      _depositWalletResponseModel = await runBusyFuture(
          repositoryImply.depositWallet(depositMoney!),
          throwException: true);
      if (_depositWalletResponseModel?.status == 'success') {
        await navigate.navigateTo(Routes.dashboard,
            arguments: DashboardArguments(index: 2));

        AppUtils.snackbar(context, message: 'Deposit Successful..!');
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> uploadKyc(context, {KycEntityModel? kycEntity}) async {
    try {
      _isLoading = true;
      _kycResponseModel = await runBusyFuture(repositoryImply.kyc(kycEntity!),
          throwException: true);
      if (_kycResponseModel?.status == 'success') {
        AppUtils.snackbar(context, message: 'Kyc uploaded Successfully..!');
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateNotificationToken(context,
      {NotificationUserEntityModel? notificationUser}) async {
    try {
      _notificationUserResponseModel = await runBusyFuture(
          repositoryImply.notificationToke(notificationUser!),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteNotificationToken(context, {String? id}) async {
    try {
      await runBusyFuture(repositoryImply.deleteNotificationToke(id!),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> usersPrefer(
    context,
  ) async {
    try {
      _preferenceResponseModel = await runBusyFuture(
          repositoryImply.userPreference(),
          throwException: true);
    } catch (e) {
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> paymentMethod(
    context,
  ) async {
    try {
      _isLoading = true;
      _paymentGateResponseModel = await runBusyFuture(
          repositoryImply.paymentMethod(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> initiateMessage(context) async {
    try {
      _initiateChatResponseModel = await runBusyFuture(
          repositoryImply.initiateChat(),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getMessage(context, {String? id}) async {
    try {
      _getMessageResponse = await runBusyFuture(
          repositoryImply.getMessages(id!),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> sendMessage(context, {SendMessageEntityModel? send}) async {
    try {
      _sendMessageResponseModel = await runBusyFuture(
          repositoryImply.sendMessage(send!),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> postToCloudinary(context,
      {PostUserCloudEntityModel? postCloudinary}) async {
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

  void makePayment({amount, context, String? walletId}) async {
    // const secretKey = 'sk_test_d9830d6c7a17c2b69f22ccb0589b560c902f6059';

    // final request = PaystackTransactionRequest(
    //   reference: 'ps_${DateTime.now().microsecondsSinceEpoch}',
    //   secretKey: secretKey,
    //   email: session.usersData['user']['email'],
    //   amount: amount * 100,
    //   currency: PaystackCurrency.ngn,
    //   channel: [
    //     PaystackPaymentChannel.mobileMoney,
    //     PaystackPaymentChannel.card,
    //     PaystackPaymentChannel.ussd,
    //     PaystackPaymentChannel.bankTransfer,
    //     PaystackPaymentChannel.bank,
    //     PaystackPaymentChannel.qr,
    //     PaystackPaymentChannel.eft,
    //   ],
    // );

    // initializingPayment = true;
    // final initializedTransaction =
    //     await PaymentService.initializeTransaction(request);

    // if (!initializedTransaction.status) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     backgroundColor: Colors.red,
    //     content: Text(initializedTransaction.message),
    //   ));

    //   return;
    // }

    // final response = await PaymentService.showPaymentModal(context,
    //         transaction: initializedTransaction,
    //         // Callback URL must match the one specified on your paystack dashboard,
    //         callbackUrl:
    //             'https://snappy.appypie.com/webservices/InAppPaymentGateway/paystack/response.php?method=success')
    //     .then((_) async {
    //   return await PaymentService.verifyTransaction(
    //     paystackSecretKey: secretKey,
    //     initializedTransaction.data?.reference ?? request.reference,
    //   );
    // });

    // print("response:::$response");

    final uniqueTransRef = PayWithPayStack().generateUuidV4();

    PayWithPayStack().now(
        context: context,
        secretKey: "sk_test_d9830d6c7a17c2b69f22ccb0589b560c902f6059",
        customerEmail: session.usersData['user']['email'],
        reference: uniqueTransRef,
        currency: "NGN",
        amount: amount,
        callbackUrl:
            "https://snappy.appypie.com/webservices/InAppPaymentGateway/paystack/response.php?method=success",
        transactionCompleted: (paymentData) async {
          print('complete:${paymentData.status}');
          if (paymentData.status == 'success') {
            await depositMoney(context,
                depositMoney: DepositWalletEntityModel(
                    amount: amount.toString(),
                    currency: 'NGN',
                    channel: 'paystack',
                    walletId: walletId));
          }
          debugPrint(paymentData.toString());
        },
        transactionNotCompleted: (reason) {
          debugPrint("==> Transaction failed reason $reason");
        });
  }

  swapFlowMeth(context) {
    if (dailyLimit == "unlimited") {
      swap(context,
          swap: SwapEntiyModel(
              fromAmount: fromCurrencylController.text,
              toAmount: toCurrencylController.text,
              fromCurrency: fromCurrencyCode,
              toCurrency: toCurrencyCode,
              amount: toCurrencylController.text,
              rate: exchangeRateResponseModel!.data!.rate));
      return;
    }
    if (dailyLimit > transaction) {
      swap(context,
          swap: SwapEntiyModel(
              fromAmount: fromCurrencylController.text,
              toAmount: toCurrencylController.text,
              fromCurrency: fromCurrencyCode,
              toCurrency: toCurrencyCode,
              amount: toCurrencylController.text,
              rate: exchangeRateResponseModel!.data!.rate));
    } else {
      AppUtils.snackbar(context,
          message: 'You have exceeded your daily limit..', error: true);
    }
    notifyListeners();
  }

  handleFlutterPaymentInitialization(
      {amount, context, String? walletId}) async {
    final Customer customer = Customer(
        name: session.usersData['user']['firstName'],
        phoneNumber: session.usersData['user']['phone'],
        email: session.usersData['user']['email']);
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-c2f20bd64cbacd523ebb2542ad58aa00-X",
        currency: "NGN",
        redirectUrl: "https://flutterwave.com/pay/shiidotgyt",
        txRef: walletId!,
        amount: "$amount",
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "My Payment"),
        isTestMode: true);

    final ChargeResponse response = await flutterwave.charge();
    if (response.status?.toLowerCase() == 'successful') {
      await navigate.navigateTo(Routes.dashboard,
          arguments: DashboardArguments(index: 2));
      depositMoney(context,
          depositMoney: DepositWalletEntityModel(
              amount: amount.toString(),
              currency: 'NGN',
              channel: 'flutterwave',
              walletId: walletId));
    }
    print("${response.toJson()}");
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

  shwWalletCurrencyDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              fireOnViewModelReadyOnce: true,
              onViewModelReady: (model) {
                WidgetsBinding.instance
                    .addPostFrameCallback((e) => model.getStatistics(context));
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return AlertDialog(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        if (model.getStatsResponseModel != null &&
                            model.getStatsResponseModel!.data!.wallets!
                                .isNotEmpty)
                          ...model.getStatsResponseModel!.data!.wallets!.map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (e.currency != 'NGN') {
                                  currencyController.text = e.currency!;
                                  _walletAmount = e;
                                  notifyListeners();
                                }

                                Navigator.pop(context);
                                return;
                              },
                              child: e.currency == 'NGN'
                                  ? SizedBox.shrink()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: e.currency ?? '',
                                          color: AppColor.black,
                                          fontSize: 16.2.sp,
                                        ),
                                        SizedBox(
                                          height: 3.2.h,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              });
        },
      );
}
