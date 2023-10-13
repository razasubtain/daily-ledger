import 'package:digi_app/app/app.router.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StackedView<SettingsViewModel> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SettingsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBar(
            text: 'Settings',
            showLeading: false,
          )),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              viewModel.service.navigateTo(Routes.viewPolicyView);
            },
            leading: const Icon(Iconsax.document),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          verticalSpaceSmall,
          ListTile(
            onTap: () async {
              await viewModel.launchUrl();
            },
            leading: const Icon(Iconsax.sms),
            title: const Text(
              'Contact us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          verticalSpaceSmall,
          ListTile(
            onTap: () {
              viewModel.service.navigateTo(Routes.deleteAllDataView);
            },
            leading: const Icon(Iconsax.warning_2),
            title: const Text(
              'Delete/Reset all data',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  SettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SettingsViewModel();
}
