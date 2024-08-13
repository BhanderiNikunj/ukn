import 'package:flutter_ukn_earning_app/exports.dart';

class TermsAndConditionController extends GetxController {
  TermsAndConditionModel? termsAndConditionModel;
  bool isLoading = false;

  Future<void> readTermsAndConditon() async {
    isLoading = true;
    update();
    termsAndConditionModel = await ApiHelper.readTermsAndConditon();
    isLoading = false;
    update();
  }
}
