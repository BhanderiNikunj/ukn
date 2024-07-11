// ignore_for_file: use_build_context_synchronously

import 'package:unk/exports.dart';

class ScratchCardController extends GetxController {
  String coin = "";

  void generateData() {
    List<String> list = [];
    list.addAll(generalSettingModel?.data.scratchCoins ?? []);
    list.shuffle();
    coin = list.first;
    update();
  }

  Future<void> updateUserPoint({required BuildContext context}) async {
    CommonModel model = await ApiHelper.updateScratchPoint(
      userId: userData?.id.toString() ?? "",
      coin: coin,
    );

    if (model.status) {
      CommonWidget.commonSnackBar(
        context: context,
        message: model.message,
        type: SnackBarType.successData,
      );
    } else {
      CommonWidget.commonSnackBar(
        context: context,
        message: model.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
