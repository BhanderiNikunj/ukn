import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/utils/api_helper.dart';

import '../../../common/common_validator.dart';

class SignupController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowText = true;
  bool isReShowText = true;

  Future<void> userSignUp() async {
    LoginDataModel signUpData = LoginDataModel(
      id: "",
      email: emailIdController.text,
      password: passwordController.text,
      isAdmin: false,
    );

    LoginModel data = await ApiHelper.userSignupData(signupData: signUpData);
    if(!CommonValidator.emailValidate(email: emailIdController.text)){
      Get.snackbar("Enter valid Email Address", "Change Email");
    } else if(passwordController.text.length <= 7){
      Get.snackbar("Please Enter Minimum 8 digit character", "Change Password");
    } else if(passwordController.text.length != rePasswordController.text.length){
      Get.snackbar("Please Enter same character", "Enter Right Password");
    } else if(data.status){
      print("-------Korat----------");
      CommonRoute.popAndPushNamed(page: RouteList.login_screen);
      print("-------Nikunj----------");
    }
   }
}
