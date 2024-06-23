import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/utils/api_helper.dart';

class LoginController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowText = true;

  Future<void> userLogin() async {
    LoginDataModel loginData = LoginDataModel(
      email: emailIdController.text,
      password: passwordController.text,
      id: "",
    );
    LoginModel data = await ApiHelper.userLoginData(loginData: loginData);
    if (data.status) {
      CommonRoute.popAndPushNamed(page: RouteList.home_screen);
      return;
    }
  }
}
