import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../ui/screen/dashboard/dashboard_screen.dart';
import '../../../ui/screen/onboarding/onboarding_screen.dart';
import '../../api_folder/auth_api.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnboardingScreen, initial: true),
  MaterialRoute(page: Dashboard, initial: false),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: NetworkService),
  LazySingleton(classType: AuthApi),
], logger: StackedLogger())
class App {}