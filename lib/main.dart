import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'core/connect_end/model/send_monet_entity_model.dart';
import 'core/connect_end/model/withdrawal_entity_model.dart';
import 'core/core_folder/app/app.locator.dart';
import 'core/core_folder/app/app.router.dart';
import 'core/core_folder/manager/shared_preference.dart';

final navigate = locator<NavigationService>();
var globalfCMToken;

Future<void> main() async {
  // Ensure Flutter is initialized
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ✅ Run async tasks in parallel (non-blocking UI)
  Future.wait([
    setupServices(),
    setScreenOrientation(),
  ]).then((_) {
    // ✅ Remove splash screen after async tasks complete
    FlutterNativeSplash.remove();
    getScreen();
  }).catchError((e) {
    debugPrint("Error during startup: $e");
    FlutterNativeSplash.remove(); // Ensure splash screen still clears
  });

  // ✅ Start app immediately (No UI delay)
  runApp(const MyApp());
}

// ✅ Initialize Shared Preferences & Services
Future<void> setupServices() async {
  setupLocator();
  await locator<SharedPreferencesService>().initilize();
}

getScreen() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (SharedPreferencesService.instance.isLoggedIn == false) {
      return;
    } else {
      navigate.navigateTo(
        Routes.welcomeBackScreen,
        arguments: WelcomeBackScreenArguments(
            name: SharedPreferencesService.instance.usersData['user']
                ['firstName'],
            transaction: 'login',
            withdraw: WithdrawalEntityModel(),
            sendMoney: SendMonetEntityModel()),
      );
    }
  });
}

// ✅ Set Screen Orientation (Runs in Parallel)
Future<void> setScreenOrientation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 977),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        initialRoute: SharedPreferencesService.instance.isLoggedIn == false
            ? Routes.onboardingScreen
            : Routes.welcomeBackLoginScreen,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
}
