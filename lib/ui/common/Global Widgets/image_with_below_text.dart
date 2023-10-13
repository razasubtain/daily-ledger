import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class ImageWithBelowText extends StatelessWidget {
  const ImageWithBelowText({
    super.key,
    this.imageUrl = 'assets/images/transaction.png',
    this.text = 'You have not made any\nTransaction today',
  });
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpaceTiny,
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
