// ignore_for_file: use_build_context_synchronously

import 'package:unk/exports.dart';

class SignupController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isShowText = true;
  bool isReShowText = true;
  bool isLoading = false;

  Future<void> userSignUp({required BuildContext context}) async {
    isLoading = true;
    update();

    LoginDataModel data = LoginDataModel(
      id: 0,
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
      isLoading = false;
      update();
      CommonRoute.popAndPushNamed(
        page: RouteList.add_user_data_screen,
        arguments: apiResponse.data,
      );
      CommonWidget.commonSnackBar(
        context: context,
        message: apiResponse.message,
        type: SnackBarType.successData,
      );
    } else {
      isLoading = false;
      update();
      CommonWidget.commonSnackBar(
        context: context,
        message: apiResponse.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
