import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/screen/chat_screen.dart';
import '../../../ui/screen/create_account_screen.dart';
import '../../../ui/screen/create_password_screen.dart';
import '../../../ui/screen/dashboard/dashboard_screen.dart';
import '../../../ui/screen/dashboard/transaction/transaction_screen.dart';
import '../../../ui/screen/dashboard/wallet/send_money.dart';
import '../../../ui/screen/dashboard/wallet/view_wallet_screen.dart';
import '../../../ui/screen/dashboard/wallet/wallet_screen.dart';
import '../../../ui/screen/forgot_password_screen.dart';
import '../../../ui/screen/kyc/upload_documents.dart';
import '../../../ui/screen/login_screen.dart';
import '../../../ui/screen/onboarding/onboarding_screen.dart';
import '../../../ui/screen/profile_screen.dart';
import '../../../ui/screen/reset_password_screen.dart';
import '../../../ui/screen/setup_screen.dart';
import '../../../ui/screen/update_profile_screen.dart';
import '../../../ui/screen/verify_screen.dart';
import '../../../ui/screen/webview_chat_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../connect_end/contract/contract_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/cloudinary_network_service.dart';
import '../network/network_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardingScreen, initial: true),
  MaterialRoute(page: Dashboard, initial: false),
  MaterialRoute(page: LoginScreen, initial: false),
  MaterialRoute(page: CreateAccountScreen, initial: false),
  MaterialRoute(page: CreatePassworsScreen, initial: false),
  MaterialRoute(page: UpdateProfileScreen, initial: false),
  MaterialRoute(page: TransactionScreen, initial: false),
  MaterialRoute(page: SetupScreen, initial: false),
  MaterialRoute(page: ResetPasswordScreen, initial: false),
  MaterialRoute(page: ForgotPasswordScreen, initial: false),
  MaterialRoute(page: VerifyScreen, initial: false),
  MaterialRoute(page: SendMoneyScreen, initial: false),
  MaterialRoute(page: ProfileScreen, initial: false),
  MaterialRoute(page: UploadDocumentsScreen, initial: false),
  MaterialRoute(page: ViewWalletScreen, initial: false),
  MaterialRoute(page: ChatScreen, initial: false),
  MaterialRoute(page: WalletScreen, initial: false),
  MaterialRoute(page: WebviewChatScreen, initial: false),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: NetworkService),
  LazySingleton(classType: CloudinaryNetworkService),
  LazySingleton(classType: AuthApi),
  LazySingleton(classType: AuthContractsImpl),
  LazySingleton(classType: AuthRepoImpl),
  LazySingleton(classType: AuthViewModel),
], logger: StackedLogger())
class App {}
