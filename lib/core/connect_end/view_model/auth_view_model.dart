import 'dart:io';
import 'dart:async';
import "package:collection/collection.dart";
import 'package:daalu_pay/core/connect_end/model/add_account_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/ali_pay_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/all_exchange_rates_response_model/all_exchange_rates_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/create_pin_response_model/create_pin_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_entity_model.dart';
import 'package:daalu_pay/core/connect_end/model/deposit_wallet_response_model/deposit_wallet_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/get_a_notification_message_model/get_a_notification_message_model.dart'
    show GetANotificationMessageModel;
import 'package:daalu_pay/core/connect_end/model/get_all_notifications_response_model/get_all_notifications_response_model.dart';
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
import 'package:daalu_pay/core/connect_end/model/verify_pin_response_model/verify_pin_response_model.dart';
import 'package:daalu_pay/core/connect_end/model/withdrawal_entity_model.dart';
import 'package:daalu_pay/main.dart';
import 'package:daalu_pay/ui/app_assets/app_image.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterwave_standard_smart/flutterwave.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:stacked/stacked.dart';
import '../../../firebase_options.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/contant.dart';
import '../../../ui/app_assets/country_const.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/screen/dashboard/wallet/withdrawal_screen.dart';
import '../../../ui/widget/button_widget.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../../firebase_api.dart';
import '../model/add_account_response_model/add_account_response_model.dart';
import '../model/get_bank_account_response_model/get_bank_account_response_model.dart';
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
import '../model/update_user_entity_model.dart';
import '../model/withdrawal_history_response_model/withdrawal_history_response_model.dart';
import '../model/withdrawal_response_model/withdrawal_response_model.dart';
import '../repo/repo_impl.dart';
import '../model/get_swapped_transactions_response_model/datum.dart' as sp;
import 'debouncer.dart';
import '../model/all_exchange_rates_response_model/datum.dart' as ex;

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

  var _firebaseMessage;

  int currentPageWallet = 0;

  String? radioValue; //Initial definition of radio button value
  String? choice = '';

  TextEditingController sendAmountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController recipientWalletIdController = TextEditingController();
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
  PostUserVerificationCloudResponse? _postUserVerificationCloudResponseAvatar;
  PostUserVerificationCloudResponse?
      get postUserVerificationCloudResponseAvatar =>
          _postUserVerificationCloudResponseAvatar;

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
  Wallet? _walletAmount;
  Wallet? get walletAmount => _walletAmount;

  final _pickImage = ImagePickerHandler();
  File? image;

  File? passportPhoto;
  String? filename;

  String fromCurrency = AppImage.nigeria_flag;
  String toCurrency = AppImage.china_flag;
  String fromCurrencyCode = 'NGN';
  String toCurrencyCode = 'CNY';
  String createCurrencyCode = '';

  TextEditingController fromCurrencylController =
      TextEditingController(text: '0');
  TextEditingController toCurrencylController =
      TextEditingController(text: '0');
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

  CreatePinResponseModel? get createPinResponseModel => _createPinResponseModel;
  CreatePinResponseModel? _createPinResponseModel;
  VerifyPinResponseModel? get verifyPinResponseModel => _verifyPinResponseModel;
  VerifyPinResponseModel? _verifyPinResponseModel;
  AllExchangeRatesResponseModel? get allExchangeRatesResponseModel =>
      _allExchangeRatesResponseModel;
  AllExchangeRatesResponseModel? _allExchangeRatesResponseModel;

  AddAccountResponseModel? _accountResponseModel;
  AddAccountResponseModel? get accountResponseModel => _accountResponseModel;
  GetBankAccountResponseModel? _getBankAccountResponseModel;
  GetBankAccountResponseModel? get getBankAccountResponseModel =>
      _getBankAccountResponseModel;
  WithdrawalResponseModel? _withdrawalResponseModel;
  WithdrawalResponseModel? get withdrawalResponseModel =>
      _withdrawalResponseModel;
  WithdrawalHistoryResponseModel? _withdrawalHistoryResponseModel;
  WithdrawalHistoryResponseModel? get withdrawalHistoryResponseModel =>
      _withdrawalHistoryResponseModel;

  TextEditingController withdrawAmount = TextEditingController();
  TextEditingController withdrawBankAccount = TextEditingController();
  GlobalKey<FormState> withdrawFormkey = GlobalKey<FormState>();
//
  TextEditingController addAccuntName = TextEditingController();
  TextEditingController addAccuntNumber = TextEditingController();
  TextEditingController addBankName = TextEditingController();
  GlobalKey<FormState> addAccntFormkey = GlobalKey<FormState>();

  DateTime nowFilter = DateTime.now();
  String? filterDateTime;

  Wallet? w;
  Wallet? walletHome;
  Wallet? walletHomeAlipay;

  GetAllNotificationsResponseModel? _getAllNotificationsResponseModel;
  GetAllNotificationsResponseModel? get getAllNotificationsResponseModel =>
      _getAllNotificationsResponseModel;

  GetANotificationMessageModel? _getANotificationMessageModel;
  GetANotificationMessageModel? get getANotificationMessageModel =>
      _getANotificationMessageModel;

  radioButtonChanges(String value) {
    radioValue = value;
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
    notifyListeners();
  }

  showSendMoneyDialog(context, amount, code, {Wallet? wallet}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Dialog(
                  backgroundColor: AppColor.white,
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 250.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.2.h,
                          ),
                          TextView(
                            text: 'Confirm Send Money',
                            color: AppColor.black,
                            fontSize: 17.2.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10.2.h,
                          ),
                          TextView(
                            text:
                                'Are your sure you want to send $amount $code',
                            color: AppColor.black,
                            fontSize: 15.2.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: AppColor.primary, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Back',
                                      color: AppColor.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigate.navigateTo(Routes.welcomeBackScreen,
                                      arguments: WelcomeBackScreenArguments(
                                          name: '',
                                          transaction: 'send money',
                                          withdraw: WithdrawalEntityModel(),
                                          sendMoney: SendMonetEntityModel(
                                              amount: sendAmountController.text,
                                              recipientEmail:
                                                  emailController.text,
                                              description: desController.text,
                                              recipientName:
                                                  nameController.text,
                                              documentType: choice == 'wallet'
                                                  ? 'alipay_id'
                                                  : choice == ''
                                                      ? 'barcode'
                                                      : 'barcode',
                                              recipientAddress: choice ==
                                                      'wallet'
                                                  ? recipientWalletIdController
                                                      .text
                                                  : choice == ''
                                                      ? recipientWalletIdController
                                                          .text
                                                      : '${_postUserVerificationCloudResponse?.publicId}.${_postUserVerificationCloudResponse?.format}',
                                              currency: wallet != null
                                                  ? wallet.currency
                                                  : currencyController.text,
                                              qrCode:
                                                  '${_postUserVerificationCloudResponse?.publicId}.${_postUserVerificationCloudResponse?.format}')));
                                  model.notifyListeners();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      border: Border.all(
                                          color: AppColor.white, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Confirm',
                                      color: AppColor.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          model.isLoading
                              ? TextView(
                                  text: 'Loading...',
                                  color: AppColor.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  showSendMoneyAlipayDialog(context, amount, code, {Wallet? wallet}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Dialog(
                  backgroundColor: AppColor.white,
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 250.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.2.h,
                          ),
                          TextView(
                            text: 'Confirm Send Money',
                            color: AppColor.black,
                            fontSize: 17.2.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10.2.h,
                          ),
                          TextView(
                            text:
                                'Are your sure you want to send $amount $code',
                            color: AppColor.black,
                            fontSize: 15.2.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: AppColor.primary, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Back',
                                      color: AppColor.primary,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigate.navigateTo(Routes.welcomeBackScreen,
                                      arguments: WelcomeBackScreenArguments(
                                          name: '',
                                          transaction: 'send money',
                                          withdraw: WithdrawalEntityModel(),
                                          sendMoney: SendMonetEntityModel(
                                              amount: sendAmountController.text,
                                              recipientEmail:
                                                  emailController.text,
                                              description: desController.text,
                                              recipientName:
                                                  nameController.text,
                                              documentType: 'barcode',
                                              recipientAddress:
                                                  recipientWalletIdController
                                                      .text,
                                              currency: wallet != null
                                                  ? wallet.currency
                                                  : currencyController.text,
                                              qrCode:
                                                  '${_postUserVerificationCloudResponse?.publicId}.${_postUserVerificationCloudResponse?.format}')));
                                  model.notifyListeners();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      border: Border.all(
                                          color: AppColor.white, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Confirm',
                                      color: AppColor.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          model.isLoading
                              ? TextView(
                                  text: 'Loading...',
                                  color: AppColor.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  showWithrawMoneyDialog(context, amount, account,
      {WithdrawalEntityModel? withdraw}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Dialog(
                  backgroundColor: AppColor.white,
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 250.w,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.2.h,
                          ),
                          TextView(
                            text: 'Confirm Withdrawal',
                            color: AppColor.black,
                            fontSize: 17.2.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10.2.h,
                          ),
                          TextView(
                            text:
                                'Are your sure you want to withdraw $amount NGN to your bank account $account?',
                            color: AppColor.black,
                            fontSize: 15.2.sp,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: AppColor.primary, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Back',
                                      color: AppColor.primary,
                                      fontSize: 17.4.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigate.navigateTo(Routes.welcomeBackScreen,
                                      arguments: WelcomeBackScreenArguments(
                                          name: '',
                                          transaction: 'withdraw money',
                                          withdraw: WithdrawalEntityModel(
                                              amount: amount,
                                              bankAccountId:
                                                  withdraw!.bankAccountId),
                                          sendMoney: SendMonetEntityModel()));
                                  model.notifyListeners();
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      border: Border.all(
                                          color: AppColor.white, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: TextView(
                                      text: 'Confirm',
                                      color: AppColor.white,
                                      fontSize: 17.4.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          model.isLoading
                              ? TextView(
                                  text: 'Loading...',
                                  color: AppColor.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  Future<void> initNotificationToken() async {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await FirebaseApi().initNotification();
    } else {
      await Firebase.initializeApp();
    }
    _firebaseMessage = FirebaseMessaging.instance;
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

  Future<void> createPin({String? pin, contxt}) async {
    try {
      _isLoading = true;
      _createPinResponseModel = await runBusyFuture(
          repositoryImply.createPin(pin!),
          throwException: true);

      if (_createPinResponseModel?.status == 'success') {
        _isLoading = false;
        SharedPreferencesService.instance.isVerified = true;
        SharedPreferencesService.instance.isFirstLogin = true;
        await AppUtils.snackbar(contxt,
            message: 'You have successfully created a pin for verification');
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

  Future<void> verifyPin(contxt,
      {String? transaction,
      String? pin,
      Wallet? wallet,
      WithdrawalEntityModel? withdraw,
      SendMonetEntityModel? send}) async {
    try {
      _isLoading = true;
      _verifyPinResponseModel = await runBusyFuture(
          repositoryImply.verifyPin(pin!),
          throwException: true);

      if (_verifyPinResponseModel!.status == 'success') {
        if (transaction == 'send money') {
          sendMoney(contxt, sendMoney: send);
        }
        if (transaction == 'withdraw money') {
          withdrawFunds(contxt, withdrawEntity: withdraw);
        } else {
          navigate.navigateTo(Routes.dashboard,
              arguments: DashboardArguments(index: 0));
        }
      }

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

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

  void getAvatarImage(BuildContext context) {
    try {
      _pickImage.pickImage(
          context: context,
          file: (file) {
            image = file;
            filename = image!.path.split("/").last;
            postUserToCloudinary(context,
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

  Future<void> capturePhoto(context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front, // Use front camera
      imageQuality: 85, // Compress image
    );

    if (pickedFile != null) {
      _cropImage(File(pickedFile.path), context);
    }
    notifyListeners();
  }

  Future<void> _cropImage(File imageFile, context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(
          ratioX: 35, ratioY: 45), // Standard passport size ratio (3.5:4.5)
      compressQuality: 90,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Passport Photo',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Passport Photo',
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      passportPhoto = File(croppedFile.path);
      uploadDocumentImage(context);
      notifyListeners();
    }
    notifyListeners();
  }

  void uploadDocumentImage(BuildContext context) {
    try {
      _isLoading = true;
      postToCloudinary(context,
          postCloudinary: PostUserCloudEntityModel(
              file: MultipartFile.fromBytes(
                  formartFileImage(passportPhoto).readAsBytesSync(),
                  filename: passportPhoto!.path.split("/").last),
              uploadPreset: 'daalupay.staging.verification',
              apiKey: '163312741323182'));

      _isLoading = false;
    } catch (e) {
      logger.e(e);
      _isLoading = false;
    }
    notifyListeners();
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
        await AppUtils.snackbar(contxt,
            message: 'Registration is successfully');
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
        if (SharedPreferencesService.instance.isVerified == false) {
          navigate.navigateTo(Routes.welcomeBackScreen,
              arguments: WelcomeBackScreenArguments(
                  name: session.usersData['user']['firstName'],
                  transaction: 'login',
                  withdraw: WithdrawalEntityModel(),
                  sendMoney: SendMonetEntityModel()));
        } else {
          await AppUtils.snackbar(contxt,
              message: _loginResponse?.message!.toString());
          navigate.navigateTo(Routes.dashboard,
              arguments: DashboardArguments(index: 0));
        }
        _isLoading = false;
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

  Future<void> getUserRefresh() async {
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
    }
    notifyListeners();
  }

  Future<void> refreshHome() async {
    getUserRefresh();
    getStatisticsRefresh();
    notifyListeners();
  }

  Future<void> refreshNotification() async {
    getAllNotification();
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

  Future<void> getStatisticsRefresh() async {
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
      logger.d('lllll${_exchangeRateResponseModel?.toJson()}');
      _isLoading = false;
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(contxt,
          message: 'No exchange rate fror $from to $to', error: true);
    }
    notifyListeners();
  }

  Future<void> allExchangeRates(contxt) async {
    try {
      _allExchangeRatesResponseModel = await runBusyFuture(
          repositoryImply.allExchangeRate(),
          throwException: true);
      _isLoading = false;
    } catch (e) {
      logger.d(e);
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  paddWingEx({child}) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
        child: child,
      );

  exchangeConWidget(context, ex.Datum e) => Column(
        children: [
          paddWingEx(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: e.fromCurrency ?? '',
                          color: AppColor.greyKind,
                          fontSize: 17.6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: ' - ',
                          color: AppColor.greyKind,
                          fontSize: 17.6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: e.toCurrency ?? '',
                          color: AppColor.greyKind,
                          fontSize: 17.6.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    TextView(
                      text: DateFormat('yyyy-MM-dd hh:mm a')
                          .format(DateTime.parse(e.createdAt.toString())),
                      color: AppColor.greyKind,
                      fontSize: 13.8.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: e.rate ?? '',
                      color: AppColor.greyKind,
                      fontSize: 17.2.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    TextView(
                      text: 'Exchange Rate',
                      color: AppColor.greyKind,
                      fontSize: 14.2.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColor.grey,
            thickness: .4.sp,
          ),
        ],
      );

  exchangeTheRate(o) {
    toCurrencylController.text =
        (double.parse(_exchangeRateResponseModel!.data!.rate!) *
                double.parse(o == '' ? '0.0' : o))
            .toString();

    notifyListeners();
  }

  exchangeFromTheRate(o) {
    fromCurrencylController.text = (double.parse(o == '' ? '0.0' : o) /
            double.parse(_exchangeRateResponseModel!.data!.rate!))
        .toString();

    notifyListeners();
  }

  void modalBottomSheetMenuFrom(contxt) {
    showModalBottomSheet(
        context: contxt,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                model.getStatistics(context);
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(contxt).viewInsets.bottom),
                  child: DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.5, // 50% of screen height
                      minChildSize:
                          0.3, // Can be dragged to 30% of screen height
                      maxChildSize:
                          0.9, // Can be dragged to 90% of screen height
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
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
                              queryFrom == ''
                                  ? Column(
                                      children: [
                                        if (model.isLoading)
                                          Center(
                                            child: SpinKitCircle(
                                              color: AppColor.primary,
                                              size: 37.8.sp,
                                            ),
                                          ),
                                        if (model.getStatsResponseModel != null)
                                          ...model.getStatsResponseModel!.data!
                                              .wallets!
                                              .map((e) => InkResponse(
                                                    onTap: () async {
                                                      w = e;
                                                      model.notifyListeners();
                                                      fromCurrency =
                                                          getWalletCurrencyCode(
                                                              e.currency);
                                                      fromCurrencyCode =
                                                          e.currency!;

                                                      notifyListeners();
                                                      await Future.delayed(
                                                          Duration(seconds: 1),
                                                          () {
                                                        Navigator.pop(context);
                                                      });
                                                      // ignore: use_build_context_synchronously
                                                      await exchangeRates(
                                                          contxt,
                                                          from:
                                                              fromCurrencyCode,
                                                          to: toCurrencyCode);
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 4.w),
                                                      decoration: BoxDecoration(
                                                          color: e == w
                                                              ? const Color
                                                                  .fromARGB(219,
                                                                  223, 233, 242)
                                                              : AppColor
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.r)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              getWalletCurrencyCode(
                                                                  e.currency)),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          TextView(
                                                            text:
                                                                '${e.currency}',
                                                            fontSize: 17.6.sp,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
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
                                        if (model.getStatsResponseModel != null)
                                          ...model.getStatsResponseModel!.data!
                                              .wallets!
                                              .where((o) => o.currency!
                                                  .toLowerCase()
                                                  .contains(
                                                      queryFrom.toLowerCase()))
                                              .map((e) => GestureDetector(
                                                    onTap: () async {
                                                      w = e;
                                                      model.notifyListeners();
                                                      fromCurrency =
                                                          getWalletCurrencyCode(
                                                              e.currency);
                                                      fromCurrencyCode =
                                                          e.currency!;

                                                      await Future.delayed(
                                                          Duration(seconds: 1),
                                                          () {
                                                        Navigator.pop(context);
                                                      });
                                                      // ignore: use_build_context_synchronously
                                                      await exchangeRates(
                                                          contxt,
                                                          from:
                                                              fromCurrencyCode,
                                                          to: toCurrencyCode);
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 4.w),
                                                      decoration: BoxDecoration(
                                                          color: e == w
                                                              ? const Color
                                                                  .fromARGB(219,
                                                                  223, 233, 242)
                                                              : AppColor
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.r)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              getWalletCurrencyCode(
                                                                  e.currency)),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          TextView(
                                                            text:
                                                                '${e.currency}',
                                                            fontSize: 17.6.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                      ],
                                    )
                            ],
                          ),
                        );
                      }),
                );
              });
        });
  }

  void modalBottomSheetMenuWallet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                model.getStatistics(context);
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.5, // 50% of screen height
                      minChildSize:
                          0.3, // Can be dragged to 30% of screen height
                      maxChildSize:
                          0.9, // Can be dragged to 90% of screen height
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
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
                                  autofocus: false,
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
                              queryFrom == ''
                                  ? Column(
                                      children: [
                                        if (model.isLoading)
                                          Center(
                                            child: SpinKitCircle(
                                              color: AppColor.primary,
                                              size: 37.8.sp,
                                            ),
                                          ),
                                        if (model.getStatsResponseModel != null)
                                          ...model.getStatsResponseModel!.data!
                                              .wallets!
                                              .map((e) => InkResponse(
                                                    onTap: () {
                                                      walletHome = e;
                                                      model.notifyListeners();
                                                      Future.delayed(
                                                          Duration(seconds: 1),
                                                          () {
                                                        Navigator.pop(context);
                                                      });
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 4.w),
                                                      decoration: BoxDecoration(
                                                          color: e == walletHome
                                                              ? const Color
                                                                  .fromARGB(219,
                                                                  223, 233, 242)
                                                              : AppColor
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.r)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              getWalletCurrencyCode(
                                                                  e.currency)),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          TextView(
                                                            text:
                                                                '${e.currency}',
                                                            fontSize: 17.4.sp,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        if (model.getStatsResponseModel != null)
                                          ...model.getStatsResponseModel!.data!
                                              .wallets!
                                              .where((o) => o.currency!
                                                  .toLowerCase()
                                                  .contains(
                                                      queryFrom.toLowerCase()))
                                              .map((e) => GestureDetector(
                                                    onTap: () {
                                                      walletHome = e;
                                                      model.notifyListeners();
                                                      Future.delayed(
                                                          Duration(seconds: 1),
                                                          () {
                                                        Navigator.pop(context);
                                                      });
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 4.w),
                                                      decoration: BoxDecoration(
                                                          color: e == walletHome
                                                              ? const Color
                                                                  .fromARGB(219,
                                                                  223, 233, 242)
                                                              : AppColor
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.r)),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.w,
                                                              horizontal: 20.w),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              getWalletCurrencyCode(
                                                                  e.currency)),
                                                          SizedBox(
                                                            width: 15.6.w,
                                                          ),
                                                          TextView(
                                                            text:
                                                                '${e.currency}',
                                                            fontSize: 17.4.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                      ],
                                    )
                            ],
                          ),
                        );
                      }),
                );
              });
        });
  }

  void modalBottomSheetMenuTo(contxt) {
    showModalBottomSheet(
        context: contxt,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                model.getStatistics(context);
              },
              disposeViewModel: true,
              builder: (_, AuthViewModel model, __) {
                return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: 0.9, // Can be dragged to 90% of screen height
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
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
                            queryTo == ''
                                ? Column(
                                    children: [
                                      if (model.isLoading)
                                        Center(
                                          child: SpinKitCircle(
                                            color: AppColor.primary,
                                            size: 37.8.sp,
                                          ),
                                        ),
                                      if (model.getStatsResponseModel != null)
                                        ...model.getStatsResponseModel!.data!
                                            .wallets!
                                            .map((e) => GestureDetector(
                                                  onTap: () async {
                                                    w = e;
                                                    model.notifyListeners();
                                                    toCurrency =
                                                        getWalletCurrencyCode(
                                                            e.currency);
                                                    toCurrencyCode =
                                                        e.currency!;
                                                    await Future.delayed(
                                                        Duration(seconds: 1),
                                                        () {
                                                      Navigator.pop(context);
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    await exchangeRates(contxt,
                                                        from: fromCurrencyCode,
                                                        to: toCurrencyCode);
                                                    notifyListeners();
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 4.w),
                                                    decoration: BoxDecoration(
                                                        color: e == w
                                                            ? const Color
                                                                .fromARGB(219,
                                                                223, 233, 242)
                                                            : AppColor
                                                                .transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    14.r)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.w,
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            getWalletCurrencyCode(
                                                                e.currency)),
                                                        SizedBox(
                                                          width: 15.6.w,
                                                        ),
                                                        TextView(
                                                          text: '${e.currency}',
                                                          fontSize: 17.6.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          maxLines: 1,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                    ],
                                  )
                                : Column(
                                    children: [
                                      if (model.getStatsResponseModel != null)
                                        ...model.getStatsResponseModel!.data!
                                            .wallets!
                                            .where((o) => o.currency!
                                                .toLowerCase()
                                                .contains(
                                                    queryTo.toLowerCase()))
                                            .map((e) => GestureDetector(
                                                  onTap: () async {
                                                    w = e;
                                                    model.notifyListeners();
                                                    toCurrency =
                                                        getWalletCurrencyCode(
                                                            e.currency);
                                                    toCurrencyCode =
                                                        e.currency!;

                                                    await Future.delayed(
                                                        Duration(seconds: 1),
                                                        () {
                                                      Navigator.pop(context);
                                                    });
                                                    // ignore: use_build_context_synchronously
                                                    await exchangeRates(contxt,
                                                        from: fromCurrencyCode,
                                                        to: toCurrencyCode);
                                                    notifyListeners();
                                                  },
                                                  child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.w,
                                                            vertical: 4.w),
                                                    decoration: BoxDecoration(
                                                        color: e == w
                                                            ? const Color
                                                                .fromARGB(219,
                                                                223, 233, 242)
                                                            : AppColor
                                                                .transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    14.r)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.w,
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            getWalletCurrencyCode(
                                                                e.currency)),
                                                        SizedBox(
                                                          width: 15.6.w,
                                                        ),
                                                        TextView(
                                                          text: '${e.currency}',
                                                          fontSize: 17.6.sp,
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                    ],
                                  )
                          ],
                        ),
                      );
                    });
              });
        });
  }

  void modalBottomSheetMenuCreateWallet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Makes the bottom sheet full-screen scrollable
      builder: (builder) {
        return ViewModelBuilder<AuthViewModel>.reactive(
          viewModelBuilder: () => AuthViewModel(),
          builder: (_, AuthViewModel model, __) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.6, // Adjust for more visible height
              minChildSize: 0.4,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
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
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Scrollable Country List
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              ...countryConst
                                  .where((e) =>
                                      queryCreate.isEmpty ||
                                      e['country']!
                                          .toLowerCase()
                                          .contains(queryCreate.toLowerCase()))
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          createCurrencyCode = e['code']!;
                                          selectCountry = e['code'];
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(6.w),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.w),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: selectCountry == e['code']
                                                ? const Color.fromARGB(
                                                    219, 223, 233, 242)
                                                : AppColor.transparent,
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(e['flag']!),
                                              SizedBox(width: 15.6.w),
                                              SizedBox(
                                                width: 160.w,
                                                child: TextView(
                                                  text: '${e['country']}',
                                                  fontSize: 16.sp,
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      // Fixed Button at the Bottom
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ButtonWidget(
                            buttonText: 'Create Wallet',
                            color: AppColor.white,
                            border: 8,
                            isLoading: _isLoadingCreate,
                            buttonColor: AppColor.primary,
                            buttonBorderColor: Colors.transparent,
                            onPressed: () {
                              if (createCurrencyCode.isNotEmpty) {
                                createWallet(context,
                                    currencyCode: createCurrencyCode);
                                model.notifyListeners();
                              } else {
                                AppUtils.snackbar(context,
                                    message:
                                        'Select country for currency code');
                              }
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void modalBottomSheetMenuSignUpCountry(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: DraggableScrollableSheet(
                        expand: false,
                        initialChildSize: 0.5, // 50% of screen height
                        minChildSize:
                            0.3, // Can be dragged to 30% of screen height
                        maxChildSize:
                            0.9, // Can be dragged to 90% of screen height
                        builder: (context, scrollController) {
                          return SingleChildScrollView(
                            controller: scrollController,
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
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                querySignUpCountry == ''
                                    ? SizedBox(
                                        width: 400.w,
                                        child: Column(
                                          children: [
                                            ...countryConst.map((e) =>
                                                GestureDetector(
                                                  onTap: () {
                                                    signUpCountryController
                                                        .text = e['country']!;
                                                    selectCountry = e['code'];
                                                    // model.notifyListeners();
                                                    Navigator.pop(context);
                                                    notifyListeners();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4.6.w,
                                                            horizontal: 10.w),
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(6.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: selectCountry ==
                                                                  e['code']
                                                              ? const Color
                                                                  .fromARGB(219,
                                                                  223, 233, 242)
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
                                                            width: 160.w,
                                                            child: TextView(
                                                              text:
                                                                  '${e['country']}',
                                                              fontSize: 17.4.sp,
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
                                                  .contains(querySignUpCountry
                                                      .toLowerCase()))
                                              .map((e) => GestureDetector(
                                                    onTap: () {
                                                      signUpCountryController
                                                          .text = e['country']!;

                                                      selectCountry = e['code'];
                                                      // model
                                                      //     .notifyListeners();

                                                      Future.delayed(
                                                          Duration(seconds: 1),
                                                          () {
                                                        Navigator.pop(context);
                                                      });
                                                      notifyListeners();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 4.6.w,
                                                              horizontal: 10.w),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(6.w),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: selectCountry ==
                                                                    e['code']
                                                                ? const Color
                                                                    .fromARGB(
                                                                    219,
                                                                    223,
                                                                    233,
                                                                    242)
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
                                                                fontSize: 17.6,
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
                          );
                        }));
              });
        });
  }

  String? bankId;
  shwUserAccountDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {
                model.getBankAccount(context);
              },
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return AlertDialog(
                  title: TextView(
                    text: 'Bank Accounts',
                    color: AppColor.black,
                    textAlign: TextAlign.center,
                    fontSize: 22.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  titleTextStyle: TextStyle(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.w, horizontal: 18.w),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        if (model.getBankAccountResponseModel != null &&
                            model.getBankAccountResponseModel!.data!.isNotEmpty)
                          ...model.getBankAccountResponseModel!.data!
                              .map((o) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          withdrawBankAccount.text =
                                              '${o.bankName} (${o.accountNumber})';
                                          bankId = o.id.toString();
                                          Navigator.pop(context);
                                          model.notifyListeners();
                                        },
                                        child: TextView(
                                          text:
                                              '${o.bankName} (${o.accountNumber})',
                                          color: AppColor.black,
                                          fontSize: 18.2.sp,
                                          textAlign: TextAlign.start,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      Divider(thickness: .3),
                                    ],
                                  ))
                      ],
                    ),
                  ),
                );
              });
        },
      );

  void modalBottomSheetMenuWithdrawFund(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              builder: (_, AuthViewModel model, __) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.5, // 50% of screen height
                      minChildSize:
                          0.3, // Can be dragged to 30% of screen height
                      maxChildSize:
                          0.9, // Can be dragged to 90% of screen height
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.w, horizontal: 20.w),
                          child: Form(
                            key: withdrawFormkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Withdraw Funds',
                                  color: AppColor.black,
                                  fontSize: 22.2.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: 2.6.h,
                                ),
                                TextView(
                                  text:
                                      'Enter the amount and select your bank account for withdrawal.',
                                  color: AppColor.grey,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormWidget(
                                  label: '0.00',
                                  hint: 'Amount',
                                  border: 10,
                                  isFilled: true,
                                  fillColor: AppColor.white,
                                  controller: withdrawAmount,
                                  validator: AppValidator.validateString(),
                                ),
                                TextView(
                                  text:
                                      'Enter the amount you wish to withdraw.',
                                  color: AppColor.grey,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormWidget(
                                  label: 'Select a bank account',
                                  hint: 'Bank Account',
                                  border: 10,
                                  isFilled: true,
                                  readOnly: true,
                                  fillColor: AppColor.white,
                                  controller: withdrawBankAccount,
                                  validator: AppValidator.validateString(),
                                  suffixWidget: IconButton(
                                      onPressed: () =>
                                          shwUserAccountDialog(context),
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                        color: AppColor.black,
                                      )),
                                ),
                                TextView(
                                  text:
                                      'Select the bank account for the withdrawal.',
                                  color: AppColor.grey,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                ButtonWidget(
                                    buttonText: 'Withdraw',
                                    color: !model.isLoading
                                        ? AppColor.white
                                        : AppColor.grey,
                                    border: 8,
                                    buttonColor: AppColor.primary,
                                    buttonBorderColor: Colors.transparent,
                                    onPressed: () {
                                      if (withdrawFormkey.currentState!
                                          .validate()) {
                                        showWithrawMoneyDialog(
                                            context,
                                            withdrawAmount.text,
                                            withdrawBankAccount.text,
                                            withdraw: WithdrawalEntityModel(
                                                amount: withdrawAmount.text,
                                                bankAccountId: bankId));
                                      }
                                    }),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextView(
                                  text:
                                      'Please ensure all details are correct before submitting.',
                                  color: AppColor.grey,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              });
        });
  }

  void modalBottomSheetMenuAddAccount(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Enables full-screen dragging
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (builder) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 70% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: .9, // Can be dragged to 90% of screen height
                    builder: (context, scrollControll) {
                      return SingleChildScrollView(
                        controller: scrollControll,
                        padding: EdgeInsets.symmetric(
                            vertical: 30.w, horizontal: 20.w),
                        child: Form(
                          key: addAccntFormkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Add Bank Account',
                                color: AppColor.black,
                                fontSize: 21.2.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 2.6.h,
                              ),
                              TextView(
                                text: 'Enter your bank account details.',
                                color: AppColor.grey,
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                label: 'Enter your account number',
                                hint: 'Amount Number',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: addAccuntNumber,
                                prefixIcon: Icons.credit_card,
                                prefixIconColor: AppColor.grey,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                label: 'Enter your bank name',
                                hint: 'Bank Name',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: addBankName,
                                prefixIcon: Icons.backup_table_outlined,
                                prefixIconColor: AppColor.grey,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormWidget(
                                label: 'Enter the account name',
                                hint: 'Account Name',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: addAccuntName,
                                prefixIcon: Icons.person_outline_sharp,
                                prefixIconColor: AppColor.grey,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              ButtonWidget(
                                  buttonText: 'Add Acount',
                                  color: !model.isLoading
                                      ? AppColor.white
                                      : AppColor.grey,
                                  border: 8,
                                  isLoading: _isLoading,
                                  buttonColor: !_isLoading
                                      ? AppColor.primary
                                      : AppColor.inGrey,
                                  buttonBorderColor: Colors.transparent,
                                  onPressed: () {
                                    if (addAccntFormkey.currentState!
                                        .validate()) {
                                      addBankAccount(context,
                                          account: AddAccountEntityModel(
                                              accountName: addAccuntName.text,
                                              accountNumber:
                                                  addAccuntNumber.text,
                                              bankName: addBankName.text));
                                      model.notifyListeners();
                                    }
                                  }),
                              SizedBox(
                                height: 250.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
        });
  }

  void onChangeRate(p0) {
    debouncer.run(() => exchangeTheRate(p0));
    notifyListeners();
  }

  void onChangeFromRate(p0) {
    debouncer.run(() => exchangeFromTheRate(p0));
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
      await AppUtils.snackbar(context,
          message: 'This wallet may have been created already', error: true);

      Navigator.pop(context);
    }
    notifyListeners();
  }

  Future<void> swap(context, {SwapEntiyModel? swap}) async {
    logger.d(swap?.toJson());
    try {
      _isLoading = true;
      var v = await runBusyFuture(repositoryImply.swap(swap!),
          throwException: true);
      _isLoading = false;
      if (v['status'] == true) {
        await AppUtils.snackbar(context, message: v['message']);
        await Future.delayed(Duration(seconds: 1), () async {
          Navigator.pop(context);

          getStatistics(context);
        });

        navigate.navigateTo(Routes.dashboard,
            arguments: DashboardArguments(index: 0));
      }
    } catch (e) {
      _isLoading = false;
      await Future.delayed(Duration(seconds: 1), () async {
        Navigator.pop(context);
      });
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

  Future<void> getSwapTransactionRefresh() async {
    try {
      _isLoading = true;
      _getSwappedTransactionsResponseModel =
          await runBusyFuture(repositoryImply.getSwap(), throwException: true);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> refreshTransaction() async {
    getSwapTransactionRefresh();
    getStatisticsRefresh();
    notifyListeners();
  }

  Future<void> updateProfile(context, {UpdateUserEntityModel? update}) async {
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
        await AppUtils.snackbar(context,
            message: v['message'] ?? 'OTP Successfully validated.');
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
        await Future.delayed(Duration(seconds: 1), () async {
          await AppUtils.snackbar(context, message: 'Transfer Successful..!');

          Navigator.pop(context);
        });
        navigate.navigateTo(Routes.dashboard,
            arguments: DashboardArguments(index: 2));
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
        _isLoading = false;
        SharedPreferencesService.instance.isKycVerified = true;
        await AppUtils.snackbarLong(context,
            message: 'Kyc uploaded Successfully..!');
        navigate.navigateTo(Routes.dashboard,
            arguments: DashboardArguments(index: 0));
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

  Future<void> addBankAccount(context, {AddAccountEntityModel? account}) async {
    try {
      _isLoading = true;
      _accountResponseModel = await runBusyFuture(
          repositoryImply.addAccount(account!),
          throwException: true);
      if (_accountResponseModel?.status == 'success') {
        _isLoading = false;
        addAccuntName.text = '';
        addAccuntNumber.text = '';
        addBankName.text = '';
        getBankAccount(context);
        await AppUtils.snackbar(context,
            message: 'Account added succcessfully..!');
        Navigator.pop(context);
      }

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getBankAccount(
    context,
  ) async {
    try {
      _isLoading = true;
      _getBankAccountResponseModel = await runBusyFuture(
          repositoryImply.getAccount(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> withdrawFunds(contxt,
      {WithdrawalEntityModel? withdrawEntity}) async {
    try {
      _isLoading = true;
      _withdrawalResponseModel = await runBusyFuture(
          repositoryImply.withdrawFund(withdrawEntity!),
          throwException: true);
      if (_withdrawalResponseModel?.status == 'success') {
        _isLoading = false;
        withdrawAmount.text = '';
        withdrawBankAccount.text = '';

        await AppUtils.snackbar(contxt, message: 'Withdrawal succcessful..!');
        withdrawHistory(contxt);
        navigate.back();
        Navigator.pop(contxt);
        Navigator.pop(contxt);
        Navigator.push(
          contxt,
          MaterialPageRoute(builder: (contxt) => WithdrawalScreen()),
        );
      }

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(contxt, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> withdrawHistory(
    context,
  ) async {
    try {
      _isLoading = true;
      _withdrawalHistoryResponseModel = await runBusyFuture(
          repositoryImply.withdrawHistory(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllNotifications(
    context,
  ) async {
    try {
      _isLoading = true;
      _getAllNotificationsResponseModel = await runBusyFuture(
          repositoryImply.getAllNotification(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllNotification() async {
    try {
      _isLoading = true;
      _getAllNotificationsResponseModel = await runBusyFuture(
          repositoryImply.getAllNotification(),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> getANotificationMessage(context, String? id) async {
    try {
      _isLoading = true;
      _getANotificationMessageModel = await runBusyFuture(
          repositoryImply.getANotificationMessage(id),
          throwException: true);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> markMessageAsRead(context, String? id) async {
    try {
      await runBusyFuture(repositoryImply.markAsReadMessage(id),
          throwException: true);
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> postUserToCloudinary(context,
      {PostUserCloudEntityModel? postCloudinary}) async {
    try {
      _isLoading = true;
      _postUserVerificationCloudResponseAvatar = await runBusyFuture(
          repositoryImply.postCloudinary(postCloudinary!),
          throwException: true);
      _isLoading = false;
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

  showConvertDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ViewModelBuilder<AuthViewModel>.reactive(
              viewModelBuilder: () => AuthViewModel(),
              onViewModelReady: (model) async {},
              disposeViewModel: false,
              builder: (_, AuthViewModel model, __) {
                return Dialog(
                  backgroundColor: AppColor.white,
                  insetPadding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding: EdgeInsets.symmetric(vertical: 12.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.2.h,
                          ),
                          TextView(
                            text: 'Review Convert Transaction',
                            color: AppColor.black,
                            fontSize: 18.2.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 10.2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Amount Convert',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextView(
                                  text:
                                      '${oCcy.format(double.parse(fromCurrencylController.text))} $fromCurrencyCode',
                                  color: AppColor.black,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.fade,
                                  fontSize: 16.2.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Amount Recieve',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextView(
                                  text:
                                      '${oCcy.format(double.parse(toCurrencylController.text))} $toCurrencyCode',
                                  color: AppColor.black,
                                  fontSize: 16.2.sp,
                                  maxLines: 1,
                                  textOverflow: TextOverflow.fade,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Divider(
                            color: AppColor.grey,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Currency Pair',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              TextView(
                                text: '$fromCurrencyCode / $toCurrencyCode',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Exchanged Rate',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              // SizedBox(
                              //   width: 16.20.w,
                              // ),
                              Wrap(children: [
                                SizedBox(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: TextView(
                                      text:
                                          '1 $fromCurrencyCode = ${exchangeRateResponseModel?.data?.rate ?? 0} $toCurrencyCode',
                                      fontSize: 16.4.sp,
                                      maxLines: 3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ])
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Transfer fee',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              TextView(
                                text: transferFee(),
                                fontSize: 16.2.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Divider(
                            color: AppColor.grey,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Final Amount',
                                color: AppColor.black,
                                fontSize: 16.2.sp,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: TextView(
                                  text:
                                      '${oCcy.format(double.parse(toCurrencylController.text))} ${getAllCurrency(toCurrencyCode)}',
                                  color: AppColor.black,
                                  textStyle: TextStyle(
                                    fontSize: 17.4.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  textOverflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(
                                          color: AppColor.primary, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextView(
                                    text: 'Back',
                                    color: AppColor.primary,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  swapFlowMeth(context);
                                  model.notifyListeners();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.w, horizontal: 10.w),
                                  decoration: BoxDecoration(
                                      color: AppColor.primary,
                                      border: Border.all(
                                          color: AppColor.white, width: .6.w),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextView(
                                    text: 'Submit',
                                    color: AppColor.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          _isLoading
                              ? SpinKitWave(
                                  color: AppColor.primary,
                                  size: 18.20.sp,
                                )
                              : SizedBox.shrink(),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
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
                  backgroundColor: AppColor.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        if (model.getStatsResponseModel != null &&
                            model.getStatsResponseModel!.data!.wallets!
                                .isNotEmpty)
                          ...model.getStatsResponseModel!.data!.wallets!
                              .where((e) => e.currency != 'NGN')
                              .map(
                                (e) => PopupMenuItem(
                                  value: '/${e.currency}',
                                  onTap: () {
                                    if (e.currency != 'NGN') {
                                      currencyController.text = e.currency!;
                                      _walletAmount = e;
                                      notifyListeners();
                                    }
                                    return;
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: e.currency ?? '',
                                        color: AppColor.black,
                                        fontSize: 22.2.sp,
                                      ),
                                      Divider(
                                        color: AppColor.navyBlueGrey,
                                        thickness: .8,
                                      )
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
  String? bankDetailType;
  shwBankDetailTypeDialog(context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColor.white,
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.w, horizontal: 20.w),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ...['Sort Code', 'IBAN', 'Routing Number'].map(
                    (e) => PopupMenuItem(
                      value: e,
                      onTap: () {
                        bankDetailType = e;
                        notifyListeners();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: e,
                            color: AppColor.black,
                            fontSize: 22.2.sp,
                          ),
                          Divider(
                            color: AppColor.navyBlueGrey,
                            thickness: .8,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
