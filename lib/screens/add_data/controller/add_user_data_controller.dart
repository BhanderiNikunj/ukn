// ignore_for_file: use_build_context_synchronously

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unk/common/colors.dart';
import 'package:unk/common/common_router.dart';
import 'package:unk/common/common_widget.dart';
import 'package:unk/common/route_list.dart';
import 'package:unk/model/login_model.dart';
import 'package:unk/model/user_data_model.dart';
import 'package:unk/model/user_model.dart';
import 'package:unk/utils/api_helper.dart';
import 'package:unk/utils/shared_helper.dart';
import 'package:unk/widgets/strings.dart';

class AddUserDataController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String genderType = "male";

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
      birthDateController.text =
          DateFormat('yyyy-MM-dd').format(results.first!);
    }
  }

  Future<void> allUserData({
    required BuildContext context,
    required LoginDataModel loginData,
  }) async {
    if (formKey.currentState?.validate() ?? false) {
      String fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
      UserData userData = UserData(
        id: 0,
        loginId: loginData.id,
        firstName: firstNameController.text,
        middleName: middleNameController.text,
        lastName: lastNameController.text,
        dateOfBirth: birthDateController.text,
        gender: genderType,
        contectNumber: mobileController.text,
        userPoint: 500,
        profilePhoto: genderType == "male"
            ? "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/v1/images/user_image/boy.png"
            : "https://homeincomeexpanseapi.000webhostapp.com/ukn_api/v1/images/user_image/girl.png",
        referCode: "",
        userDeviceToken: fcmToken,
        emailId: loginData.email,
      );
      if (!emailIdController.text.endsWith("@gmail.com")) {
        CommonWidget.commonSnackBar(
          context: context,
          message: Strings.please_enter_valid_email_id,
          type: SnackBarType.errorData,
        );
        return;
      } else if (mobileController.text.length != 10) {
        CommonWidget.commonSnackBar(
          context: context,
          message: Strings.please_enter_valid_mobile_number,
          type: SnackBarType.errorData,
        );
        return;
      }

      UserModel model = await ApiHelper.addUserData(userData: userData);
      if (model.status) {
        await SharedHelper.setLoginValue(isLogin: true);
        await SharedHelper.setLoginData(loginId: userData.loginId);
        await SharedHelper.setUserIdata(userId: model.data.id);
        CommonRoute.popAndPushNamed(page: RouteList.home_screen);
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
