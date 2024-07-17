import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:unk/common/global.dart';

import '../../../exports.dart';

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

  void changeUserData(){
    ApiHelper.updateUserData(
      //userData: userData?.firstName = updateFirstNameController.text,
    );
  }
}
