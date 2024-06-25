import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unk/common/colors.dart';

class AddUserDataController extends GetxController {
  TextEditingController emailIdController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

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
}
