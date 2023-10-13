import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:digi_app/ui/views/customer/customer_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import 'delete_all_data_viewmodel.dart';

class DeleteAllDataView extends StackedView<DeleteAllDataViewModel> {
  const DeleteAllDataView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeleteAllDataViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CommonAppBar(
            text: 'Delete all data',
          )),
      body: ListView(
        children: const [
          verticalSpaceMedium,
          Icon(
            Iconsax.danger,
            color: Colors.red,
            size: 50,
          ),
          verticalSpaceSmall,
          Text(
            'Warning!!!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          verticalSpaceLarge,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Please read carefully! all data related to this app will be deleted permanently.It includes customer information in accounts section and also all transactions related to those customer will also be deleted permnently.Moreover, all wallets in wallet section will also be deleted. This action can\'t be undo.',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          viewModel.getConfirmation();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          height: buttonHeight,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: borderRadius,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Continue',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  DeleteAllDataViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DeleteAllDataViewModel();
}
