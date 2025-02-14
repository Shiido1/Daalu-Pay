// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:daalu_pay_admin/core/connect_end/model/get_users_receipt_response_model/datum.dart'
    as _i8;
import 'package:daalu_pay_admin/ui/screen/admin_dashboard/admin_dashboard.dart'
    as _i3;
import 'package:daalu_pay_admin/ui/screen/admin_dashboard/overview/receipt_screen.dart'
    as _i5;
import 'package:daalu_pay_admin/ui/screen/admin_dashboard/overview/view_receipt.dart'
    as _i6;
import 'package:daalu_pay_admin/ui/screen/admin_dashboard/transaction/admin_transaction_screen.dart'
    as _i4;
import 'package:daalu_pay_admin/ui/screen/onboarding/onboarding_screen.dart'
    as _i2;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const onboardingScreen = '/';

  static const adminDashboard = '/admin-dashboard';

  static const adminTransactionScreen = '/admin-transaction-screen';

  static const viewUsersReceiptScreen = '/view-users-receipt-screen';

  static const viewReceipt = '/view-receipt';

  static const all = <String>{
    onboardingScreen,
    adminDashboard,
    adminTransactionScreen,
    viewUsersReceiptScreen,
    viewReceipt,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingScreen,
      page: _i2.OnboardingScreen,
    ),
    _i1.RouteDef(
      Routes.adminDashboard,
      page: _i3.AdminDashboard,
    ),
    _i1.RouteDef(
      Routes.adminTransactionScreen,
      page: _i4.AdminTransactionScreen,
    ),
    _i1.RouteDef(
      Routes.viewUsersReceiptScreen,
      page: _i5.ViewUsersReceiptScreen,
    ),
    _i1.RouteDef(
      Routes.viewReceipt,
      page: _i6.ViewReceipt,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingScreen: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingScreen(),
        settings: data,
      );
    },
    _i3.AdminDashboard: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AdminDashboard(),
        settings: data,
      );
    },
    _i4.AdminTransactionScreen: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AdminTransactionScreen(),
        settings: data,
      );
    },
    _i5.ViewUsersReceiptScreen: (data) {
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ViewUsersReceiptScreen(),
        settings: data,
      );
    },
    _i6.ViewReceipt: (data) {
      final args = data.getArgs<ViewReceiptArguments>(nullOk: false);
      return _i7.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ViewReceipt(key: args.key, datum: args.datum),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ViewReceiptArguments {
  const ViewReceiptArguments({
    this.key,
    required this.datum,
  });

  final _i7.Key? key;

  final _i8.Datum? datum;

  @override
  String toString() {
    return '{"key": "$key", "datum": "$datum"}';
  }

  @override
  bool operator ==(covariant ViewReceiptArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.datum == datum;
  }

  @override
  int get hashCode {
    return key.hashCode ^ datum.hashCode;
  }
}

extension NavigatorStateExtension on _i9.NavigationService {
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

  Future<dynamic> navigateToAdminDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminTransactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewUsersReceiptScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.viewUsersReceiptScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewReceipt({
    _i7.Key? key,
    required _i8.Datum? datum,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewReceipt,
        arguments: ViewReceiptArguments(key: key, datum: datum),
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

  Future<dynamic> replaceWithAdminDashboard([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminDashboard,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminTransactionScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminTransactionScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewUsersReceiptScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.viewUsersReceiptScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewReceipt({
    _i7.Key? key,
    required _i8.Datum? datum,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewReceipt,
        arguments: ViewReceiptArguments(key: key, datum: datum),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
