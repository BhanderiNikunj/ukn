// ignore_for_file: use_build_context_synchronously

import 'package:unk/exports.dart';

class LoginController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowText = true;

  Future<void> userLogin({required BuildContext context}) async {
    LoginDataModel loginData = LoginDataModel(
      email: emailIdController.text,
      password: passwordController.text,
      id: 0,
      isAdmin: false,
    );

    if (!loginData.email.endsWith("@gmail.com")) {
      CommonWidget.commonSnackBar(
        context: context,
        message: "Enter Valid Email id",
        type: SnackBarType.errorData,
      );
      return;
    } else if (loginData.password.length < 8) {
      CommonWidget.commonSnackBar(
        context: context,
        message: "Enter 8 charcuter passowrd",
        type: SnackBarType.errorData,
      );
      return;
    }
    LoginModel data = await ApiHelper.userLoginData(loginData: loginData);
    if (data.status) {
      await SharedHelper.setLoginValue(isLogin: true);
      await SharedHelper.setLoginData(loginId: data.data.id);
      CommonRoute.popAndPushNamed(page: RouteList.home_screen);
      CommonWidget.commonSnackBar(
        context: context,
        message: data.message,
        type: SnackBarType.successData,
      );
    } else {
      CommonWidget.commonSnackBar(
        context: context,
        message: data.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
