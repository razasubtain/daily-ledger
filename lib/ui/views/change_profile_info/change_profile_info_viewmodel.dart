import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChangeProfileInfoViewModel extends BaseViewModel {
  final cont = TextEditingController();
  final service = NavigationService();

  String hintText = '';
  String title = '';

  initialize(dynamic arg) {
    hintText = arg['hintText'] as String;
    title = arg['title'] as String;
    cont.text = arg['cont'] as String;
  }
}
