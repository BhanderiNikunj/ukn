import 'package:flutter_ukn_earning_app/exports.dart';

class AllUSerDataController extends GetxController {
  UserDataModel? userDataModel;
  RxList userList = [].obs;

  Future<void> getAllUserData() async {
    userDataModel = await ApiHelper.getAllUserData();
    userList.value = userDataModel!.data;
  }
}
