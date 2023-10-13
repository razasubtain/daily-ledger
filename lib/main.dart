import 'package:digi_app/services/hive_related/database_boxes.dart';
import 'package:flutter/material.dart';
import 'package:digi_app/app/app.bottomsheets.dart';
import 'package:digi_app/app/app.dialogs.dart';
import 'package:digi_app/app/app.locator.dart';
import 'package:digi_app/app/app.router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await DatabaseBoxes.registedAdapter();

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  locator.registerLazySingleton(() => SnackbarService());

  runApp(const MyApp());
}

extension ConverttoDouble on String {
  double toDouble() => double.parse(this);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Mont',
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(4),
            thumbColor: MaterialStateProperty.all<Color>(Colors.grey.shade500),
          )),
      title: 'Daily Ledger',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.customBottomBarView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
