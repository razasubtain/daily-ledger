import 'dart:convert';

import 'package:flutter/material.dart';

class CommonProfileWidget extends StatelessWidget {
  const CommonProfileWidget({
    super.key,
    required this.image,
    required this.radius,
  });
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: image.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: MemoryImage(
                      base64Decode(image),
                    ),
                    fit: BoxFit.cover,
                  )),
            )
          : Icon(
              size: radius,
              Icons.person,
              color: Colors.grey,
            ),
      radius: radius,
      backgroundColor: Colors.blueGrey.shade50,
    );
  }
}
