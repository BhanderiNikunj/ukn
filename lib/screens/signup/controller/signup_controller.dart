// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/utils/api_helper.dart';

class SignupController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowText = true;
  bool isReShowText = true;

  Future<void> userSignUp({required BuildContext context}) async {
    LoginDataModel data = LoginDataModel(
      id: "",
      email: emailIdController.text,
      password: passwordController.text,
      isAdmin: false,
    );

    if (!data.email.endsWith("@gmail.com")) {
      CommonWidget.commonSnackBar(
        context: context,
        message: "Enter Valid Email id",
        type: SnackBarType.errorData,
      );
      return;
    } else if (data.password.length < 8) {
      CommonWidget.commonSnackBar(
        context: context,
        message: "Enter 8 charcuter passowrd",
        type: SnackBarType.errorData,
      );
      return;
    }

    LoginModel apiResponse = await ApiHelper.userSignupData(signupData: data);

    if (apiResponse.status) {
      CommonRoute.popAndPushNamed(page: RouteList.home_screen);
      CommonWidget.commonSnackBar(
        context: context,
        message: apiResponse.message,
        type: SnackBarType.successData,
      );
    } else {
      CommonWidget.commonSnackBar(
        context: context,
        message: apiResponse.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
