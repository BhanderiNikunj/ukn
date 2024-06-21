import 'package:flutter/material.dart';

class CommonValidator {
  static hideKeyboard() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }
  static emailValidate({required String email}) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}