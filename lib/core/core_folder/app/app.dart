import 'package:daalu_pay_admin/ui/screen/admin_dashboard/admin_dashboard.dart';
import 'package:daalu_pay_admin/ui/screen/admin_dashboard/overview/receipt_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/screen/admin_dashboard/transaction/admin_transaction_screen.dart';
import '../../../ui/screen/onboarding/onboarding_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../connect_end/contract/contract_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardingScreen, initial: true),
  MaterialRoute(page: AdminDashboard, initial: false),
  MaterialRoute(page: AdminTransactionScreen, initial: false),
  MaterialRoute(page: ViewUsersReceiptScreen, initial: false),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: NetworkService),
  LazySingleton(classType: AuthApi),
  LazySingleton(classType: AuthContractsImpl),
  LazySingleton(classType: AuthRepoImpl),
  LazySingleton(classType: AuthViewModel),
], logger: StackedLogger())
class App {}
