import 'package:digi_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:digi_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:digi_app/ui/views/home/home_view.dart';
import 'package:digi_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:digi_app/ui/views/custom_bottom_bar/custom_bottom_bar_view.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:digi_app/ui/views/add_customer/add_customer_view.dart';
import 'package:digi_app/ui/views/customer_transaction/customer_transaction_view.dart';
import 'package:digi_app/ui/views/add_transaction/add_transaction_view.dart';
import 'package:digi_app/ui/views/settings/settings_view.dart';
import 'package:digi_app/ui/views/wallet_list/wallet_list_view.dart';
import 'package:digi_app/ui/views/add_wallet/add_wallet_view.dart';
import 'package:digi_app/ui/views/change_profile_info/change_profile_info_view.dart';
import 'package:digi_app/services/customer_service.dart';
import 'package:digi_app/services/wallet_service.dart';
import 'package:digi_app/ui/views/view_policy/view_policy_view.dart';
import 'package:digi_app/services/url_launcher_service.dart';
import 'package:digi_app/ui/views/delete_all_data/delete_all_data_view.dart';
import 'package:digi_app/ui/dialogs/deleting_progress/deleting_progress_dialog.dart';
import 'package:digi_app/ui/dialogs/view_content/view_content_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CustomBottomBarView),
    MaterialRoute(page: CustomerView),
    MaterialRoute(page: AddCustomerView),
    MaterialRoute(page: CustomerTransactionView),
    MaterialRoute(page: AddTransactionView),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: WalletListView),
    MaterialRoute(page: AddWalletView),
    MaterialRoute(page: ChangeProfileInfoView),
    MaterialRoute(page: ViewPolicyView),
    MaterialRoute(page: DeleteAllDataView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: CustomerService),
    LazySingleton(classType: WalletService),
    LazySingleton(classType: UrlLauncherService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: DeletingProgressDialog),
    StackedDialog(classType: ViewContentDialog),
// @stacked-dialog
  ],
)
class App {}
