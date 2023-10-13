import 'package:flutter/material.dart';

import '../../../common/ui_helpers.dart';

class HomeBalanceWidget extends StatelessWidget {
  const HomeBalanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          horizontalSpaceMedium,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Available Balance',
                style: TextStyle(fontSize: 22, fontFamily: 'Phil'),
              ),
              verticalSpaceSmall,
              Text(
                '\$897979',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'Mont'
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
