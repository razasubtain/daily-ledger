// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:digi_app/ui/views/add_customer/add_customer_view.dart' as _i6;
import 'package:digi_app/ui/views/add_transaction/add_transaction_view.dart'
    as _i8;
import 'package:digi_app/ui/views/add_wallet/add_wallet_view.dart' as _i11;
import 'package:digi_app/ui/views/change_profile_info/change_profile_info_view.dart'
    as _i12;
import 'package:digi_app/ui/views/custom_bottom_bar/custom_bottom_bar_view.dart'
    as _i4;
import 'package:digi_app/ui/views/customer/customer_view.dart' as _i5;
import 'package:digi_app/ui/views/customer_transaction/customer_transaction_view.dart'
    as _i7;
import 'package:digi_app/ui/views/delete_all_data/delete_all_data_view.dart'
    as _i14;
import 'package:digi_app/ui/views/home/home_view.dart' as _i2;
import 'package:digi_app/ui/views/settings/settings_view.dart' as _i9;
import 'package:digi_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:digi_app/ui/views/view_policy/view_policy_view.dart' as _i13;
import 'package:digi_app/ui/views/wallet_list/wallet_list_view.dart' as _i10;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const customBottomBarView = '/custom-bottom-bar-view';

  static const customerView = '/customer-view';

  static const addCustomerView = '/add-customer-view';

  static const customerTransactionView = '/customer-transaction-view';

  static const addTransactionView = '/add-transaction-view';

  static const settingsView = '/settings-view';

  static const walletListView = '/wallet-list-view';

  static const addWalletView = '/add-wallet-view';

  static const changeProfileInfoView = '/change-profile-info-view';

  static const viewPolicyView = '/view-policy-view';

  static const deleteAllDataView = '/delete-all-data-view';

  static const all = <String>{
    homeView,
    startupView,
    customBottomBarView,
    customerView,
    addCustomerView,
    customerTransactionView,
    addTransactionView,
    settingsView,
    walletListView,
    addWalletView,
    changeProfileInfoView,
    viewPolicyView,
    deleteAllDataView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.customBottomBarView,
      page: _i4.CustomBottomBarView,
    ),
    _i1.RouteDef(
      Routes.customerView,
      page: _i5.CustomerView,
    ),
    _i1.RouteDef(
      Routes.addCustomerView,
      page: _i6.AddCustomerView,
    ),
    _i1.RouteDef(
      Routes.customerTransactionView,
      page: _i7.CustomerTransactionView,
    ),
    _i1.RouteDef(
      Routes.addTransactionView,
      page: _i8.AddTransactionView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i9.SettingsView,
    ),
    _i1.RouteDef(
      Routes.walletListView,
      page: _i10.WalletListView,
    ),
    _i1.RouteDef(
      Routes.addWalletView,
      page: _i11.AddWalletView,
    ),
    _i1.RouteDef(
      Routes.changeProfileInfoView,
      page: _i12.ChangeProfileInfoView,
    ),
    _i1.RouteDef(
      Routes.viewPolicyView,
      page: _i13.ViewPolicyView,
    ),
    _i1.RouteDef(
      Routes.deleteAllDataView,
      page: _i14.DeleteAllDataView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.CustomBottomBarView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CustomBottomBarView(),
        settings: data,
      );
    },
    _i5.CustomerView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CustomerView(),
        settings: data,
      );
    },
    _i6.AddCustomerView: (data) {
      final args = data.getArgs<AddCustomerViewArguments>(
        orElse: () => const AddCustomerViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.AddCustomerView(
            key: args.key, customerId: args.customerId, isEdit: args.isEdit),
        settings: data,
      );
    },
    _i7.CustomerTransactionView: (data) {
      final args =
          data.getArgs<CustomerTransactionViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CustomerTransactionView(
            key: args.key, customerId: args.customerId),
        settings: data,
      );
    },
    _i8.AddTransactionView: (data) {
      final args = data.getArgs<AddTransactionViewArguments>(
        orElse: () => const AddTransactionViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.AddTransactionView(
            key: args.key,
            customerId: args.customerId,
            fromCustomerAccount: args.fromCustomerAccount,
            viewTransaction: args.viewTransaction,
            transactionId: args.transactionId),
        settings: data,
      );
    },
    _i9.SettingsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SettingsView(),
        settings: data,
      );
    },
    _i10.WalletListView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.WalletListView(),
        settings: data,
      );
    },
    _i11.AddWalletView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.AddWalletView(),
        settings: data,
      );
    },
    _i12.ChangeProfileInfoView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ChangeProfileInfoView(),
        settings: data,
      );
    },
    _i13.ViewPolicyView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ViewPolicyView(),
        settings: data,
      );
    },
    _i14.DeleteAllDataView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.DeleteAllDataView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddCustomerViewArguments {
  const AddCustomerViewArguments({
    this.key,
    this.customerId = '',
    this.isEdit = false,
  });

  final _i15.Key? key;

  final String customerId;

  final bool isEdit;

  @override
  String toString() {
    return '{"key": "$key", "customerId": "$customerId", "isEdit": "$isEdit"}';
  }

  @override
  bool operator ==(covariant AddCustomerViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.customerId == customerId &&
        other.isEdit == isEdit;
  }

  @override
  int get hashCode {
    return key.hashCode ^ customerId.hashCode ^ isEdit.hashCode;
  }
}

class CustomerTransactionViewArguments {
  const CustomerTransactionViewArguments({
    this.key,
    required this.customerId,
  });

  final _i15.Key? key;

  final String customerId;

  @override
  String toString() {
    return '{"key": "$key", "customerId": "$customerId"}';
  }

  @override
  bool operator ==(covariant CustomerTransactionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.customerId == customerId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ customerId.hashCode;
  }
}

class AddTransactionViewArguments {
  const AddTransactionViewArguments({
    this.key,
    this.customerId = '',
    this.fromCustomerAccount = false,
    this.viewTransaction = false,
    this.transactionId = '',
  });

  final _i15.Key? key;

  final String customerId;

  final bool fromCustomerAccount;

  final bool viewTransaction;

  final String transactionId;

  @override
  String toString() {
    return '{"key": "$key", "customerId": "$customerId", "fromCustomerAccount": "$fromCustomerAccount", "viewTransaction": "$viewTransaction", "transactionId": "$transactionId"}';
  }

  @override
  bool operator ==(covariant AddTransactionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.customerId == customerId &&
        other.fromCustomerAccount == fromCustomerAccount &&
        other.viewTransaction == viewTransaction &&
        other.transactionId == transactionId;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        customerId.hashCode ^
        fromCustomerAccount.hashCode ^
        viewTransaction.hashCode ^
        transactionId.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomBottomBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.customBottomBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.customerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCustomerView({
    _i15.Key? key,
    String customerId = '',
    bool isEdit = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addCustomerView,
        arguments: AddCustomerViewArguments(
            key: key, customerId: customerId, isEdit: isEdit),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCustomerTransactionView({
    _i15.Key? key,
    required String customerId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.customerTransactionView,
        arguments:
            CustomerTransactionViewArguments(key: key, customerId: customerId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddTransactionView({
    _i15.Key? key,
    String customerId = '',
    bool fromCustomerAccount = false,
    bool viewTransaction = false,
    String transactionId = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addTransactionView,
        arguments: AddTransactionViewArguments(
            key: key,
            customerId: customerId,
            fromCustomerAccount: fromCustomerAccount,
            viewTransaction: viewTransaction,
            transactionId: transactionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWalletListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.walletListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangeProfileInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changeProfileInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.viewPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeleteAllDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deleteAllDataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomBottomBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.customBottomBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.customerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCustomerView({
    _i15.Key? key,
    String customerId = '',
    bool isEdit = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addCustomerView,
        arguments: AddCustomerViewArguments(
            key: key, customerId: customerId, isEdit: isEdit),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCustomerTransactionView({
    _i15.Key? key,
    required String customerId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.customerTransactionView,
        arguments:
            CustomerTransactionViewArguments(key: key, customerId: customerId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddTransactionView({
    _i15.Key? key,
    String customerId = '',
    bool fromCustomerAccount = false,
    bool viewTransaction = false,
    String transactionId = '',
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addTransactionView,
        arguments: AddTransactionViewArguments(
            key: key,
            customerId: customerId,
            fromCustomerAccount: fromCustomerAccount,
            viewTransaction: viewTransaction,
            transactionId: transactionId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWalletListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.walletListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddWalletView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addWalletView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangeProfileInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changeProfileInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewPolicyView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.viewPolicyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDeleteAllDataView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.deleteAllDataView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
