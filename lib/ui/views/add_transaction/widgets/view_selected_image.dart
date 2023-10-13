import 'dart:convert';

import 'package:digi_app/ui/views/add_transaction/add_transaction_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ViewSelectedImage extends StatelessWidget {
  const ViewSelectedImage({
    super.key,
    required this.imageData,
    required this.viewModel,
    required this.customerName,
  });
  final String imageData;
  final AddTransactionViewModel viewModel;
  final String customerName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          customerName,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
            onPressed: () => viewModel.service.back(),
            icon: const Icon(
              Iconsax.arrow_square_left,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Hero(
            tag: 'image1',
            transitionOnUserGestures: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.maxFinite,
              child: Image.memory(
                base64Decode(viewModel.imageData),
                fit: BoxFit.contain,
              ),
            )),
      ),
    );
  }
}
