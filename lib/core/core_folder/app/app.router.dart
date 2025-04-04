// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daalu_pay/core/connect_end/model/get_stats_response_model/wallet.dart'
    as _i29;
import 'package:daalu_pay/core/connect_end/model/get_swapped_transactions_response_model/datum.dart'
    as _i32;
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart'
    as _i30;
import 'package:daalu_pay/core/connect_end/model/withdrawal_entity_model.dart'
    as _i31;
import 'package:daalu_pay/ui/screen/chat_screen.dart' as _i17;
import 'package:daalu_pay/ui/screen/create_account_screen.dart' as _i5;
import 'package:daalu_pay/ui/screen/create_password_screen.dart' as _i6;
import 'package:daalu_pay/ui/screen/dashboard/dashboard_screen.dart' as _i3;
import 'package:daalu_pay/ui/screen/dashboard/home/home_widget/trans_receipt_screen.dart'
    as _i23;
import 'package:daalu_pay/ui/screen/dashboard/home/notification/notification_screen.dart'
    as _i25;
import 'package:daalu_pay/ui/screen/dashboard/home/notification/view_notification_screen.dart'
    as _i26;
import 'package:daalu_pay/ui/screen/dashboard/settings/setting_screen.dart'
    as _i24;
import 'package:daalu_pay/ui/screen/dashboard/transaction/transaction_screen.dart'
    as _i8;
import 'package:daalu_pay/ui/screen/dashboard/wallet/send_money.dart' as _i13;
import 'package:daalu_pay/ui/screen/dashboard/wallet/view_wallet_screen.dart'
    as _i16;
import 'package:daalu_pay/ui/screen/dashboard/wallet/wallet_screen.dart'
    as _i18;
import 'package:daalu_pay/ui/screen/forgot_password_screen.dart' as _i11;
import 'package:daalu_pay/ui/screen/kyc/passport_screen.dart' as _i22;
import 'package:daalu_pay/ui/screen/kyc/upload_documents.dart' as _i15;
import 'package:daalu_pay/ui/screen/login_screen.dart' as _i4;
import 'package:daalu_pay/ui/screen/onboarding/onboarding_screen.dart' as _i2;
import 'package:daalu_pay/ui/screen/profile_screen.dart' as _i14;
import 'package:daalu_pay/ui/screen/reset_password_screen.dart' as _i10;
import 'package:daalu_pay/ui/screen/setup_screen.dart' as _i9;
import 'package:daalu_pay/ui/screen/update_profile_screen.dart' as _i7;
import 'package:daalu_pay/ui/screen/verify_screen.dart' as _i12;
import 'package:daalu_pay/ui/screen/webview_chat_screen.dart' as _i19;
import 'package:daalu_pay/ui/screen/welcome_back_screen.dart' as _i20;
import 'package:daalu_pay/ui/screen/welcome_back_screen_login.dart' as _i21;
import 'package:daalu_pay/ui/screen/welcome_back_screen_push.dart' as _i27;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i28;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i33;

class Routes {
  static const onboardingScreen = '/';

  static const dashboard = '/Dashboard';

  static const loginScreen = '/login-screen';

  static const createAccountScreen = '/create-account-screen';

  static const createPassworsScreen = '/create-passwors-screen';

  static const updateProfileScreen = '/update-profile-screen';

  static const transactionScreen = '/transaction-screen';

  static const setupScreen = '/setup-screen';

  static const resetPasswordScreen = '/reset-password-screen';

  static const forgotPasswordScreen = '/forgot-password-screen';

  static const verifyScreen = '/verify-screen';

  static const sendMoneyScreen = '/send-money-screen';

  static const profileScreen = '/profile-screen';

  static const uploadDocumentsScreen = '/upload-documents-screen';

  static const viewWalletScreen = '/view-wallet-screen';

  static const chatScreen = '/chat-screen';

  static const walletScreen = '/wallet-screen';

  static const webviewChatScreen = '/webview-chat-screen';

  static const welcomeBackScreen = '/welcome-back-screen';

  static const welcomeBackLoginScreen = '/welcome-back-login-screen';

  static const passportPhotoScreen = '/passport-photo-screen';

  static const transReceiptScreen = '/trans-receipt-screen';

  static const settingScreen = '/setting-screen';

  static const notificationScreen = '/notification-screen';

  static const viewNotificationScreenMessage =
      '/view-notification-screen-message';

  static const welcomeBackPushScreen = '/welcome-back-push-screen';

  static const all = <String>{
    onboardingScreen,
    dashboard,
    loginScreen,
    createAccountScreen,
    createPassworsScreen,
    updateProfileScreen,
    transactionScreen,
    setupScreen,
    resetPasswordScreen,
    forgotPasswordScreen,
    verifyScreen,
    sendMoneyScreen,
    profileScreen,
    uploadDocumentsScreen,
    viewWalletScreen,
    chatScreen,
    walletScreen,
    webviewChatScreen,
    welcomeBackScreen,
    welcomeBackLoginScreen,
    passportPhotoScreen,
    transReceiptScreen,
    settingScreen,
    notificationScreen,
    viewNotificationScreenMessage,
    welcomeBackPushScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingScreen,
      page: _i2.OnboardingScreen,
    ),
    _i1.RouteDef(
      Routes.dashboard,
      page: _i3.Dashboard,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i4.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.createAccountScreen,
      page: _i5.CreateAccountScreen,
    ),
    _i1.RouteDef(
      Routes.createPassworsScreen,
      page: _i6.CreatePassworsScreen,
    ),
    _i1.RouteDef(
      Routes.updateProfileScreen,
      page: _i7.UpdateProfileScreen,
    ),
    _i1.RouteDef(
      Routes.transactionScreen,
      page: _i8.TransactionScreen,
    ),
    _i1.RouteDef(
      Routes.setupScreen,
      page: _i9.SetupScreen,
    ),
    _i1.RouteDef(
      Routes.resetPasswordScreen,
      page: _i10.ResetPasswordScreen,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordScreen,
      page: _i11.ForgotPasswordScreen,
    ),
    _i1.RouteDef(
      Routes.verifyScreen,
      page: _i12.VerifyScreen,
    ),
    _i1.RouteDef(
      Routes.sendMoneyScreen,
      page: _i13.SendMoneyScreen,
    ),
    _i1.RouteDef(
      Routes.profileScreen,
      page: _i14.ProfileScreen,
    ),
    _i1.RouteDef(
      Routes.uploadDocumentsScreen,
      page: _i15.UploadDocumentsScreen,
    ),
    _i1.RouteDef(
      Routes.viewWalletScreen,
      page: _i16.ViewWalletScreen,
    ),
    _i1.RouteDef(
      Routes.chatScreen,
      page: _i17.ChatScreen,
    ),
    _i1.RouteDef(
      Routes.walletScreen,
      page: _i18.WalletScreen,
    ),
    _i1.RouteDef(
      Routes.webviewChatScreen,
      page: _i19.WebviewChatScreen,
    ),
    _i1.RouteDef(
      Routes.welcomeBackScreen,
      page: _i20.WelcomeBackScreen,
    ),
    _i1.RouteDef(
      Routes.welcomeBackLoginScreen,
      page: _i21.WelcomeBackLoginScreen,
    ),
    _i1.RouteDef(
      Routes.passportPhotoScreen,
      page: _i22.PassportPhotoScreen,
    ),
    _i1.RouteDef(
      Routes.transReceiptScreen,
      page: _i23.TransReceiptScreen,
    ),
    _i1.RouteDef(
      Routes.settingScreen,
      page: _i24.SettingScreen,
    ),
    _i1.RouteDef(
      Routes.notificationScreen,
      page: _i25.NotificationScreen,
    ),
    _i1.RouteDef(
      Routes.viewNotificationScreenMessage,
      page: _i26.ViewNotificationScreenMessage,
    ),
    _i1.RouteDef(
      Routes.welcomeBackPushScreen,
      page: _i27.WelcomeBackPushScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingScreen(),
        settings: data,
      );
    },
    _i3.Dashboard: (data) {
      final args = data.getArgs<DashboardArguments>(
        orElse: () => const DashboardArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.Dashboard(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i4.LoginScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginScreen(),
        settings: data,
      );
    },
    _i5.CreateAccountScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CreateAccountScreen(),
        settings: data,
      );
    },
    _i6.CreatePassworsScreen: (data) {
      final args = data.getArgs<CreatePassworsScreenArguments>(
        orElse: () => const CreatePassworsScreenArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CreatePassworsScreen(key: args.key),
        settings: data,
      );
    },
    _i7.UpdateProfileScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.UpdateProfileScreen(),
        settings: data,
      );
    },
    _i8.TransactionScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TransactionScreen(),
        settings: data,
      );
    },
    _i9.SetupScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SetupScreen(),
        settings: data,
      );
    },
    _i10.ResetPasswordScreen: (data) {
      final args = data.getArgs<ResetPasswordScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.ResetPasswordScreen(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i11.ForgotPasswordScreen: (data) {
      final args = data.getArgs<ForgotPasswordScreenArguments>(
        orElse: () => const ForgotPasswordScreenArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ForgotPasswordScreen(key: args.key),
        settings: data,
      );
    },
    _i12.VerifyScreen: (data) {
      final args = data.getArgs<VerifyScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.VerifyScreen(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i13.SendMoneyScreen: (data) {
      final args = data.getArgs<SendMoneyScreenArguments>(
        orElse: () => const SendMoneyScreenArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.SendMoneyScreen(key: args.key, wallet: args.wallet),
        settings: data,
      );
    },
    _i14.ProfileScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProfileScreen(),
        settings: data,
      );
    },
    _i15.UploadDocumentsScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.UploadDocumentsScreen(),
        settings: data,
      );
    },
    _i16.ViewWalletScreen: (data) {
      final args = data.getArgs<ViewWalletScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.ViewWalletScreen(key: args.key, wallet: args.wallet),
        settings: data,
      );
    },
    _i17.ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(
        orElse: () => const ChatScreenArguments(),
      );
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ChatScreen(key: args.key),
        settings: data,
      );
    },
    _i18.WalletScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.WalletScreen(),
        settings: data,
      );
    },
    _i19.WebviewChatScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.WebviewChatScreen(),
        settings: data,
      );
    },
    _i20.WelcomeBackScreen: (data) {
      final args = data.getArgs<WelcomeBackScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.WelcomeBackScreen(
            key: args.key,
            name: args.name,
            transaction: args.transaction,
            sendMoney: args.sendMoney,
            withdraw: args.withdraw),
        settings: data,
      );
    },
    _i21.WelcomeBackLoginScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.WelcomeBackLoginScreen(),
        settings: data,
      );
    },
    _i22.PassportPhotoScreen: (data) {
      final args = data.getArgs<PassportPhotoScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.PassportPhotoScreen(
            key: args.key,
            docFile: args.docFile,
            docNumber: args.docNumber,
            docType: args.docType),
        settings: data,
      );
    },
    _i23.TransReceiptScreen: (data) {
      final args = data.getArgs<TransReceiptScreenArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.TransReceiptScreen(key: args.key, e: args.e),
        settings: data,
      );
    },
    _i24.SettingScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.SettingScreen(),
        settings: data,
      );
    },
    _i25.NotificationScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.NotificationScreen(),
        settings: data,
      );
    },
    _i26.ViewNotificationScreenMessage: (data) {
      final args =
          data.getArgs<ViewNotificationScreenMessageArguments>(nullOk: false);
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.ViewNotificationScreenMessage(
          key: args.key,
          id: args.id,
        ),
        settings: data,
      );
    },
    _i27.WelcomeBackPushScreen: (data) {
      return _i28.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.WelcomeBackPushScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DashboardArguments {
  const DashboardArguments({
    this.key,
    this.index,
  });

  final _i28.Key? key;

  final int? index;

  @override
  String toString() {
    return '{"key": "$key", "index": "$index"}';
  }

  @override
  bool operator ==(covariant DashboardArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.index == index;
  }

  @override
  int get hashCode {
    return key.hashCode ^ index.hashCode;
  }
}

class CreatePassworsScreenArguments {
  const CreatePassworsScreenArguments({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CreatePassworsScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ResetPasswordScreenArguments {
  const ResetPasswordScreenArguments({
    this.key,
    required this.email,
  });

  final _i28.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant ResetPasswordScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class ForgotPasswordScreenArguments {
  const ForgotPasswordScreenArguments({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ForgotPasswordScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class VerifyScreenArguments {
  const VerifyScreenArguments({
    this.key,
    required this.email,
  });

  final _i28.Key? key;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "email": "$email"}';
  }

  @override
  bool operator ==(covariant VerifyScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^ email.hashCode;
  }
}

class SendMoneyScreenArguments {
  const SendMoneyScreenArguments({
    this.key,
    this.wallet,
  });

  final _i28.Key? key;

  final _i29.Wallet? wallet;

  @override
  String toString() {
    return '{"key": "$key", "wallet": "$wallet"}';
  }

  @override
  bool operator ==(covariant SendMoneyScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.wallet == wallet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ wallet.hashCode;
  }
}

class ViewWalletScreenArguments {
  const ViewWalletScreenArguments({
    this.key,
    required this.wallet,
  });

  final _i28.Key? key;

  final _i29.Wallet? wallet;

  @override
  String toString() {
    return '{"key": "$key", "wallet": "$wallet"}';
  }

  @override
  bool operator ==(covariant ViewWalletScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.wallet == wallet;
  }

  @override
  int get hashCode {
    return key.hashCode ^ wallet.hashCode;
  }
}

class ChatScreenArguments {
  const ChatScreenArguments({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChatScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WelcomeBackScreenArguments {
  const WelcomeBackScreenArguments({
    this.key,
    required this.name,
    required this.transaction,
    required this.sendMoney,
    required this.withdraw,
  });

  final _i28.Key? key;

  final String? name;

  final String? transaction;

  final _i30.SendMonetEntityModel? sendMoney;

  final _i31.WithdrawalEntityModel? withdraw;

  @override
  String toString() {
    return '{"key": "$key", "name": "$name", "transaction": "$transaction", "sendMoney": "$sendMoney", "withdraw": "$withdraw"}';
  }

  @override
  bool operator ==(covariant WelcomeBackScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.name == name &&
        other.transaction == transaction &&
        other.sendMoney == sendMoney &&
        other.withdraw == withdraw;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        transaction.hashCode ^
        sendMoney.hashCode ^
        withdraw.hashCode;
  }
}

class PassportPhotoScreenArguments {
  const PassportPhotoScreenArguments({
    this.key,
    required this.docFile,
    required this.docNumber,
    required this.docType,
  });

  final _i28.Key? key;

  final String? docFile;

  final String? docNumber;

  final String? docType;

  @override
  String toString() {
    return '{"key": "$key", "docFile": "$docFile", "docNumber": "$docNumber", "docType": "$docType"}';
  }

  @override
  bool operator ==(covariant PassportPhotoScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.docFile == docFile &&
        other.docNumber == docNumber &&
        other.docType == docType;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        docFile.hashCode ^
        docNumber.hashCode ^
        docType.hashCode;
  }
}

class TransReceiptScreenArguments {
  const TransReceiptScreenArguments({
    this.key,
    required this.e,
  });

  final _i28.Key? key;

  final _i32.Datum e;

  @override
  String toString() {
    return '{"key": "$key", "e": "$e"}';
  }

  @override
  bool operator ==(covariant TransReceiptScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.e == e;
  }

  @override
  int get hashCode {
    return key.hashCode ^ e.hashCode;
  }
}

class ViewNotificationScreenMessageArguments {
  const ViewNotificationScreenMessageArguments({
    this.key,
    required this.id,
    this.onBack,
  });

  final _i28.Key? key;

  final String? id;

  final Function? onBack;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "onBack": "$onBack"}';
  }

  @override
  bool operator ==(covariant ViewNotificationScreenMessageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id && other.onBack == onBack;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ onBack.hashCode;
  }
}

extension NavigatorStateExtension on _i33.NavigationService {
  Future<dynamic> navigateToOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboard({
    _i28.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.dashboard,
        arguments: DashboardArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateAccountScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.createAccountScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreatePassworsScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createPassworsScreen,
        arguments: CreatePassworsScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.updateProfileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.transactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetupScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setupScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordScreen({
    _i28.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.resetPasswordScreen,
        arguments: ResetPasswordScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordScreen,
        arguments: ForgotPasswordScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyScreen({
    _i28.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.verifyScreen,
        arguments: VerifyScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSendMoneyScreen({
    _i28.Key? key,
    _i29.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sendMoneyScreen,
        arguments: SendMoneyScreenArguments(key: key, wallet: wallet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadDocumentsScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uploadDocumentsScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewWalletScreen({
    _i28.Key? key,
    required _i29.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewWalletScreen,
        arguments: ViewWalletScreenArguments(key: key, wallet: wallet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatScreen,
        arguments: ChatScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWebviewChatScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.webviewChatScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcomeBackScreen({
    _i28.Key? key,
    required String? name,
    required String? transaction,
    required _i30.SendMonetEntityModel? sendMoney,
    required _i31.WithdrawalEntityModel? withdraw,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.welcomeBackScreen,
        arguments: WelcomeBackScreenArguments(
            key: key,
            name: name,
            transaction: transaction,
            sendMoney: sendMoney,
            withdraw: withdraw),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcomeBackLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeBackLoginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPassportPhotoScreen({
    _i28.Key? key,
    required String? docFile,
    required String? docNumber,
    required String? docType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.passportPhotoScreen,
        arguments: PassportPhotoScreenArguments(
            key: key, docFile: docFile, docNumber: docNumber, docType: docType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransReceiptScreen({
    _i28.Key? key,
    required _i32.Datum e,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transReceiptScreen,
        arguments: TransReceiptScreenArguments(key: key, e: e),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNotificationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.notificationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewNotificationScreenMessage({
    _i28.Key? key,
    required String? id,
    Function? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewNotificationScreenMessage,
        arguments: ViewNotificationScreenMessageArguments(
            key: key, id: id, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcomeBackPushScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeBackPushScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboard({
    _i28.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.dashboard,
        arguments: DashboardArguments(key: key, index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateAccountScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.createAccountScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreatePassworsScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createPassworsScreen,
        arguments: CreatePassworsScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpdateProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.updateProfileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.transactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetupScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.setupScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordScreen({
    _i28.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.resetPasswordScreen,
        arguments: ResetPasswordScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forgotPasswordScreen,
        arguments: ForgotPasswordScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyScreen({
    _i28.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.verifyScreen,
        arguments: VerifyScreenArguments(key: key, email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSendMoneyScreen({
    _i28.Key? key,
    _i29.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sendMoneyScreen,
        arguments: SendMoneyScreenArguments(key: key, wallet: wallet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadDocumentsScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uploadDocumentsScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewWalletScreen({
    _i28.Key? key,
    required _i29.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewWalletScreen,
        arguments: ViewWalletScreenArguments(key: key, wallet: wallet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatScreen({
    _i28.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatScreen,
        arguments: ChatScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walletScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWebviewChatScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.webviewChatScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeBackScreen({
    _i28.Key? key,
    required String? name,
    required String? transaction,
    required _i30.SendMonetEntityModel? sendMoney,
    required _i31.WithdrawalEntityModel? withdraw,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.welcomeBackScreen,
        arguments: WelcomeBackScreenArguments(
            key: key,
            name: name,
            transaction: transaction,
            sendMoney: sendMoney,
            withdraw: withdraw),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeBackLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcomeBackLoginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPassportPhotoScreen({
    _i28.Key? key,
    required String? docFile,
    required String? docNumber,
    required String? docType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.passportPhotoScreen,
        arguments: PassportPhotoScreenArguments(
            key: key, docFile: docFile, docNumber: docNumber, docType: docType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransReceiptScreen({
    _i28.Key? key,
    required _i32.Datum e,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transReceiptScreen,
        arguments: TransReceiptScreenArguments(key: key, e: e),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNotificationScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.notificationScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewNotificationScreenMessage({
    _i28.Key? key,
    required String? id,
    Function? onBack,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewNotificationScreenMessage,
        arguments: ViewNotificationScreenMessageArguments(
            key: key, id: id, onBack: onBack),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeBackPushScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcomeBackPushScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
