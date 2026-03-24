// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daalu_pay/core/connect_end/model/get_stats_response_model/wallet.dart'
    as _i30;
import 'package:daalu_pay/core/connect_end/model/get_swapped_transactions_response_model/datum.dart'
    as _i33;
import 'package:daalu_pay/core/connect_end/model/send_monet_entity_model.dart'
    as _i31;
import 'package:daalu_pay/core/connect_end/model/withdrawal_entity_model.dart'
    as _i32;
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
import 'package:daalu_pay/ui/screen/webview_terms_screen.dart' as _i28;
import 'package:daalu_pay/ui/screen/welcome_back_screen.dart' as _i20;
import 'package:daalu_pay/ui/screen/welcome_back_screen_login.dart' as _i21;
import 'package:daalu_pay/ui/screen/welcome_back_screen_push.dart' as _i27;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as _i29;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i34;

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

  static const webviewTermsScreen = '/webview-terms-screen';

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
    webviewTermsScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.onboardingScreen, page: _i2.OnboardingScreen),
    _i1.RouteDef(Routes.dashboard, page: _i3.Dashboard),
    _i1.RouteDef(Routes.loginScreen, page: _i4.LoginScreen),
    _i1.RouteDef(Routes.createAccountScreen, page: _i5.CreateAccountScreen),
    _i1.RouteDef(Routes.createPassworsScreen, page: _i6.CreatePassworsScreen),
    _i1.RouteDef(Routes.updateProfileScreen, page: _i7.UpdateProfileScreen),
    _i1.RouteDef(Routes.transactionScreen, page: _i8.TransactionScreen),
    _i1.RouteDef(Routes.setupScreen, page: _i9.SetupScreen),
    _i1.RouteDef(Routes.resetPasswordScreen, page: _i10.ResetPasswordScreen),
    _i1.RouteDef(Routes.forgotPasswordScreen, page: _i11.ForgotPasswordScreen),
    _i1.RouteDef(Routes.verifyScreen, page: _i12.VerifyScreen),
    _i1.RouteDef(Routes.sendMoneyScreen, page: _i13.SendMoneyScreen),
    _i1.RouteDef(Routes.profileScreen, page: _i14.ProfileScreen),
    _i1.RouteDef(
      Routes.uploadDocumentsScreen,
      page: _i15.UploadDocumentsScreen,
    ),
    _i1.RouteDef(Routes.viewWalletScreen, page: _i16.ViewWalletScreen),
    _i1.RouteDef(Routes.chatScreen, page: _i17.ChatScreen),
    _i1.RouteDef(Routes.walletScreen, page: _i18.WalletScreen),
    _i1.RouteDef(Routes.webviewChatScreen, page: _i19.WebviewChatScreen),
    _i1.RouteDef(Routes.welcomeBackScreen, page: _i20.WelcomeBackScreen),
    _i1.RouteDef(
      Routes.welcomeBackLoginScreen,
      page: _i21.WelcomeBackLoginScreen,
    ),
    _i1.RouteDef(Routes.passportPhotoScreen, page: _i22.PassportPhotoScreen),
    _i1.RouteDef(Routes.transReceiptScreen, page: _i23.TransReceiptScreen),
    _i1.RouteDef(Routes.settingScreen, page: _i24.SettingScreen),
    _i1.RouteDef(Routes.notificationScreen, page: _i25.NotificationScreen),
    _i1.RouteDef(
      Routes.viewNotificationScreenMessage,
      page: _i26.ViewNotificationScreenMessage,
    ),
    _i1.RouteDef(
      Routes.welcomeBackPushScreen,
      page: _i27.WelcomeBackPushScreen,
    ),
    _i1.RouteDef(Routes.webviewTermsScreen, page: _i28.WebviewTermsScreen),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingScreen: (data) {
      final args = data.getArgs<OnboardingScreenArguments>(
        orElse: () => const OnboardingScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.OnboardingScreen(key: args.key),
        settings: data,
      );
    },
    _i3.Dashboard: (data) {
      final args = data.getArgs<DashboardArguments>(
        orElse: () => const DashboardArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.Dashboard(key: args.key, index: args.index),
        settings: data,
      );
    },
    _i4.LoginScreen: (data) {
      final args = data.getArgs<LoginScreenArguments>(
        orElse: () => const LoginScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.LoginScreen(key: args.key),
        settings: data,
      );
    },
    _i5.CreateAccountScreen: (data) {
      final args = data.getArgs<CreateAccountScreenArguments>(
        orElse: () => const CreateAccountScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.CreateAccountScreen(key: args.key),
        settings: data,
      );
    },
    _i6.CreatePassworsScreen: (data) {
      final args = data.getArgs<CreatePassworsScreenArguments>(
        orElse: () => const CreatePassworsScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.CreatePassworsScreen(key: args.key),
        settings: data,
      );
    },
    _i7.UpdateProfileScreen: (data) {
      final args = data.getArgs<UpdateProfileScreenArguments>(
        orElse: () => const UpdateProfileScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.UpdateProfileScreen(key: args.key),
        settings: data,
      );
    },
    _i8.TransactionScreen: (data) {
      final args = data.getArgs<TransactionScreenArguments>(
        orElse: () => const TransactionScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.TransactionScreen(key: args.key),
        settings: data,
      );
    },
    _i9.SetupScreen: (data) {
      final args = data.getArgs<SetupScreenArguments>(
        orElse: () => const SetupScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.SetupScreen(key: args.key),
        settings: data,
      );
    },
    _i10.ResetPasswordScreen: (data) {
      final args = data.getArgs<ResetPasswordScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.ResetPasswordScreen(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i11.ForgotPasswordScreen: (data) {
      final args = data.getArgs<ForgotPasswordScreenArguments>(
        orElse: () => const ForgotPasswordScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.ForgotPasswordScreen(key: args.key),
        settings: data,
      );
    },
    _i12.VerifyScreen: (data) {
      final args = data.getArgs<VerifyScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i12.VerifyScreen(key: args.key, email: args.email),
        settings: data,
      );
    },
    _i13.SendMoneyScreen: (data) {
      final args = data.getArgs<SendMoneyScreenArguments>(
        orElse: () => const SendMoneyScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i13.SendMoneyScreen(key: args.key, wallet: args.wallet),
        settings: data,
      );
    },
    _i14.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(
        orElse: () => const ProfileScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.ProfileScreen(key: args.key),
        settings: data,
      );
    },
    _i15.UploadDocumentsScreen: (data) {
      final args = data.getArgs<UploadDocumentsScreenArguments>(
        orElse: () => const UploadDocumentsScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i15.UploadDocumentsScreen(key: args.key),
        settings: data,
      );
    },
    _i16.ViewWalletScreen: (data) {
      final args = data.getArgs<ViewWalletScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i16.ViewWalletScreen(key: args.key, wallet: args.wallet),
        settings: data,
      );
    },
    _i17.ChatScreen: (data) {
      final args = data.getArgs<ChatScreenArguments>(
        orElse: () => const ChatScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.ChatScreen(key: args.key),
        settings: data,
      );
    },
    _i18.WalletScreen: (data) {
      final args = data.getArgs<WalletScreenArguments>(
        orElse: () => const WalletScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i18.WalletScreen(key: args.key),
        settings: data,
      );
    },
    _i19.WebviewChatScreen: (data) {
      final args = data.getArgs<WebviewChatScreenArguments>(
        orElse: () => const WebviewChatScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.WebviewChatScreen(key: args.key),
        settings: data,
      );
    },
    _i20.WelcomeBackScreen: (data) {
      final args = data.getArgs<WelcomeBackScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i20.WelcomeBackScreen(
          key: args.key,
          name: args.name,
          transaction: args.transaction,
          sendMoney: args.sendMoney,
          withdraw: args.withdraw,
        ),
        settings: data,
      );
    },
    _i21.WelcomeBackLoginScreen: (data) {
      final args = data.getArgs<WelcomeBackLoginScreenArguments>(
        orElse: () => const WelcomeBackLoginScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.WelcomeBackLoginScreen(key: args.key),
        settings: data,
      );
    },
    _i22.PassportPhotoScreen: (data) {
      final args = data.getArgs<PassportPhotoScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.PassportPhotoScreen(
          key: args.key,
          docFile: args.docFile,
          docNumber: args.docNumber,
          docType: args.docType,
        ),
        settings: data,
      );
    },
    _i23.TransReceiptScreen: (data) {
      final args = data.getArgs<TransReceiptScreenArguments>(nullOk: false);
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i23.TransReceiptScreen(key: args.key, e: args.e),
        settings: data,
      );
    },
    _i24.SettingScreen: (data) {
      final args = data.getArgs<SettingScreenArguments>(
        orElse: () => const SettingScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i24.SettingScreen(key: args.key),
        settings: data,
      );
    },
    _i25.NotificationScreen: (data) {
      final args = data.getArgs<NotificationScreenArguments>(
        orElse: () => const NotificationScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.NotificationScreen(key: args.key),
        settings: data,
      );
    },
    _i26.ViewNotificationScreenMessage: (data) {
      final args = data.getArgs<ViewNotificationScreenMessageArguments>(
        nullOk: false,
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i26.ViewNotificationScreenMessage(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i27.WelcomeBackPushScreen: (data) {
      final args = data.getArgs<WelcomeBackPushScreenArguments>(
        orElse: () => const WelcomeBackPushScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i27.WelcomeBackPushScreen(key: args.key),
        settings: data,
      );
    },
    _i28.WebviewTermsScreen: (data) {
      final args = data.getArgs<WebviewTermsScreenArguments>(
        orElse: () => const WebviewTermsScreenArguments(),
      );
      return _i29.MaterialPageRoute<dynamic>(
        builder: (context) => _i28.WebviewTermsScreen(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class OnboardingScreenArguments {
  const OnboardingScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class DashboardArguments {
  const DashboardArguments({this.key, this.index});

  final _i29.Key? key;

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

class LoginScreenArguments {
  const LoginScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CreateAccountScreenArguments {
  const CreateAccountScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CreateAccountScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CreatePassworsScreenArguments {
  const CreatePassworsScreenArguments({this.key});

  final _i29.Key? key;

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

class UpdateProfileScreenArguments {
  const UpdateProfileScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant UpdateProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class TransactionScreenArguments {
  const TransactionScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant TransactionScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class SetupScreenArguments {
  const SetupScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SetupScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ResetPasswordScreenArguments {
  const ResetPasswordScreenArguments({this.key, required this.email});

  final _i29.Key? key;

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

  final _i29.Key? key;

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
  const VerifyScreenArguments({this.key, required this.email});

  final _i29.Key? key;

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
  const SendMoneyScreenArguments({this.key, this.wallet});

  final _i29.Key? key;

  final _i30.Wallet? wallet;

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

class ProfileScreenArguments {
  const ProfileScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class UploadDocumentsScreenArguments {
  const UploadDocumentsScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant UploadDocumentsScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ViewWalletScreenArguments {
  const ViewWalletScreenArguments({this.key, required this.wallet});

  final _i29.Key? key;

  final _i30.Wallet? wallet;

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

  final _i29.Key? key;

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

class WalletScreenArguments {
  const WalletScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WalletScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WebviewChatScreenArguments {
  const WebviewChatScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WebviewChatScreenArguments other) {
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

  final _i29.Key? key;

  final String? name;

  final String? transaction;

  final _i31.SendMonetEntityModel? sendMoney;

  final _i32.WithdrawalEntityModel? withdraw;

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

class WelcomeBackLoginScreenArguments {
  const WelcomeBackLoginScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WelcomeBackLoginScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class PassportPhotoScreenArguments {
  const PassportPhotoScreenArguments({
    this.key,
    required this.docFile,
    required this.docNumber,
    required this.docType,
  });

  final _i29.Key? key;

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
  const TransReceiptScreenArguments({this.key, required this.e});

  final _i29.Key? key;

  final _i33.Datum e;

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

class SettingScreenArguments {
  const SettingScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SettingScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class NotificationScreenArguments {
  const NotificationScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant NotificationScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ViewNotificationScreenMessageArguments {
  const ViewNotificationScreenMessageArguments({this.key, required this.id});

  final _i29.Key? key;

  final String? id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant ViewNotificationScreenMessageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class WelcomeBackPushScreenArguments {
  const WelcomeBackPushScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WelcomeBackPushScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class WebviewTermsScreenArguments {
  const WebviewTermsScreenArguments({this.key});

  final _i29.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant WebviewTermsScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i34.NavigationService {
  Future<dynamic> navigateToOnboardingScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingScreen,
      arguments: OnboardingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDashboard({
    _i29.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.dashboard,
      arguments: DashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.loginScreen,
      arguments: LoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateAccountScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.createAccountScreen,
      arguments: CreateAccountScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreatePassworsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.createPassworsScreen,
      arguments: CreatePassworsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUpdateProfileScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.updateProfileScreen,
      arguments: UpdateProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTransactionScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.transactionScreen,
      arguments: TransactionScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetupScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.setupScreen,
      arguments: SetupScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToResetPasswordScreen({
    _i29.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.resetPasswordScreen,
      arguments: ResetPasswordScreenArguments(key: key, email: email),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToForgotPasswordScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.forgotPasswordScreen,
      arguments: ForgotPasswordScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToVerifyScreen({
    _i29.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.verifyScreen,
      arguments: VerifyScreenArguments(key: key, email: email),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSendMoneyScreen({
    _i29.Key? key,
    _i30.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.sendMoneyScreen,
      arguments: SendMoneyScreenArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUploadDocumentsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.uploadDocumentsScreen,
      arguments: UploadDocumentsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToViewWalletScreen({
    _i29.Key? key,
    required _i30.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.viewWalletScreen,
      arguments: ViewWalletScreenArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToChatScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.chatScreen,
      arguments: ChatScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWalletScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.walletScreen,
      arguments: WalletScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWebviewChatScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.webviewChatScreen,
      arguments: WebviewChatScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWelcomeBackScreen({
    _i29.Key? key,
    required String? name,
    required String? transaction,
    required _i31.SendMonetEntityModel? sendMoney,
    required _i32.WithdrawalEntityModel? withdraw,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.welcomeBackScreen,
      arguments: WelcomeBackScreenArguments(
        key: key,
        name: name,
        transaction: transaction,
        sendMoney: sendMoney,
        withdraw: withdraw,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWelcomeBackLoginScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.welcomeBackLoginScreen,
      arguments: WelcomeBackLoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToPassportPhotoScreen({
    _i29.Key? key,
    required String? docFile,
    required String? docNumber,
    required String? docType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.passportPhotoScreen,
      arguments: PassportPhotoScreenArguments(
        key: key,
        docFile: docFile,
        docNumber: docNumber,
        docType: docType,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToTransReceiptScreen({
    _i29.Key? key,
    required _i33.Datum e,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.transReceiptScreen,
      arguments: TransReceiptScreenArguments(key: key, e: e),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSettingScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.settingScreen,
      arguments: SettingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToNotificationScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.notificationScreen,
      arguments: NotificationScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToViewNotificationScreenMessage({
    _i29.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.viewNotificationScreenMessage,
      arguments: ViewNotificationScreenMessageArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWelcomeBackPushScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.welcomeBackPushScreen,
      arguments: WelcomeBackPushScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToWebviewTermsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.webviewTermsScreen,
      arguments: WebviewTermsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingScreen,
      arguments: OnboardingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDashboard({
    _i29.Key? key,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.dashboard,
      arguments: DashboardArguments(key: key, index: index),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithLoginScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.loginScreen,
      arguments: LoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithCreateAccountScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.createAccountScreen,
      arguments: CreateAccountScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithCreatePassworsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.createPassworsScreen,
      arguments: CreatePassworsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithUpdateProfileScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.updateProfileScreen,
      arguments: UpdateProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithTransactionScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.transactionScreen,
      arguments: TransactionScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSetupScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.setupScreen,
      arguments: SetupScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithResetPasswordScreen({
    _i29.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.resetPasswordScreen,
      arguments: ResetPasswordScreenArguments(key: key, email: email),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithForgotPasswordScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.forgotPasswordScreen,
      arguments: ForgotPasswordScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithVerifyScreen({
    _i29.Key? key,
    required String? email,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.verifyScreen,
      arguments: VerifyScreenArguments(key: key, email: email),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSendMoneyScreen({
    _i29.Key? key,
    _i30.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.sendMoneyScreen,
      arguments: SendMoneyScreenArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithUploadDocumentsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.uploadDocumentsScreen,
      arguments: UploadDocumentsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithViewWalletScreen({
    _i29.Key? key,
    required _i30.Wallet? wallet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.viewWalletScreen,
      arguments: ViewWalletScreenArguments(key: key, wallet: wallet),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithChatScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.chatScreen,
      arguments: ChatScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWalletScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.walletScreen,
      arguments: WalletScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWebviewChatScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.webviewChatScreen,
      arguments: WebviewChatScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWelcomeBackScreen({
    _i29.Key? key,
    required String? name,
    required String? transaction,
    required _i31.SendMonetEntityModel? sendMoney,
    required _i32.WithdrawalEntityModel? withdraw,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.welcomeBackScreen,
      arguments: WelcomeBackScreenArguments(
        key: key,
        name: name,
        transaction: transaction,
        sendMoney: sendMoney,
        withdraw: withdraw,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWelcomeBackLoginScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.welcomeBackLoginScreen,
      arguments: WelcomeBackLoginScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithPassportPhotoScreen({
    _i29.Key? key,
    required String? docFile,
    required String? docNumber,
    required String? docType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.passportPhotoScreen,
      arguments: PassportPhotoScreenArguments(
        key: key,
        docFile: docFile,
        docNumber: docNumber,
        docType: docType,
      ),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithTransReceiptScreen({
    _i29.Key? key,
    required _i33.Datum e,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.transReceiptScreen,
      arguments: TransReceiptScreenArguments(key: key, e: e),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSettingScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.settingScreen,
      arguments: SettingScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithNotificationScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.notificationScreen,
      arguments: NotificationScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithViewNotificationScreenMessage({
    _i29.Key? key,
    required String? id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.viewNotificationScreenMessage,
      arguments: ViewNotificationScreenMessageArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWelcomeBackPushScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.welcomeBackPushScreen,
      arguments: WelcomeBackPushScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithWebviewTermsScreen({
    _i29.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.webviewTermsScreen,
      arguments: WebviewTermsScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
