// ignore_for_file: use_build_context_synchronously

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:unk/exports.dart';

class UpdateUserDataController extends GetxController {
  TextEditingController updateEmailIdController = TextEditingController();
  TextEditingController updateFirstNameController = TextEditingController();
  TextEditingController updateLastNameController = TextEditingController();
  TextEditingController updateMiddleNameController = TextEditingController();
  TextEditingController updateMobileController = TextEditingController();
  TextEditingController updateBirthDateController = TextEditingController();
  String updateGenderType = "male";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void pickDate({required BuildContext context}) async {
    var results = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            daySplashColor: Colors.transparent,
            selectedDayHighlightColor: AppColor.primary3Color,
          ),
          dialogSize: Size(325.w, 400.h),
          borderRadius: BorderRadius.circular(15),
        ) ??
        [];
    if (results.isNotEmpty) {
      updateBirthDateController.text =
          DateFormat('yyyy-MM-dd').format(results.first!);
    }
  }

  Future<void> updateUserData({
    required BuildContext context,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
      UserData data = UserData(
        id: userData?.id ?? 0,
        loginId: userData?.loginId ?? 0,
        firstName: updateFirstNameController.text,
        middleName: updateMiddleNameController.text,
        lastName: updateLastNameController.text,
        dateOfBirth: updateBirthDateController.text,
        gender: updateGenderType,
        contectNumber: updateMobileController.text,
        userPoint: userData?.userPoint ?? 0,
        profilePhoto: updateGenderType == "male"
            ? "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/v1/images/user_image/boy.png"
            : "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/v1/images/user_image/girl.png",
        referCode: "",
        userDeviceToken: fcmToken,
        emailId: userData?.emailId ?? "",
      );
      if (!updateEmailIdController.text.endsWith("@gmail.com")) {
        CommonWidget.commonSnackBar(
          context: context,
          message: Strings.please_enter_valid_email_id,
          type: SnackBarType.errorData,
        );
        return;
      } else if (updateMobileController.text.length != 10) {
        CommonWidget.commonSnackBar(
          context: context,
          message: Strings.please_enter_valid_mobile_number,
          type: SnackBarType.errorData,
        );
        return;
      }

      UserModel model = await ApiHelper.updateUserData(userData: data);
      if (model.status) {
        await SharedHelper.setLoginValue(isLogin: true);
        await SharedHelper.setLoginData(loginId: model.data.id);
        await SharedHelper.setUserIdata(userId: model.data.id);
        userData = model.data;
        CommonRoute.pop();
        CommonWidget.commonSnackBar(
          context: context,
          message: model.message,
          type: SnackBarType.successData,
        );
        return;
      }
      CommonWidget.commonSnackBar(
        context: context,
        message: model.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
