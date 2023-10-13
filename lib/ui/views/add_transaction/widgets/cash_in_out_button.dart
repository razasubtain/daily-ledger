import 'package:digi_app/ui/common/app_colors.dart';
import 'package:digi_app/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class CashInOutButton extends StatelessWidget {
  const CashInOutButton({
    super.key,
    required this.cashInFunction,
    required this.cashOutFunction,
  });
  final Function cashInFunction;
  final Function cashOutFunction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                cashOutFunction();
              },
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: cashOutCard,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Cash-Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          horizontalSpaceMedium,
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                cashInFunction();
              },
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: cashInCard,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Cash-In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
