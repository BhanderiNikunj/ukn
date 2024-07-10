// ignore_for_file: use_build_context_synchronously

import 'package:unk/exports.dart';

class RedeemDataController extends GetxController {
  Future<void> addRewardHistory({
    required String price,
    required String coin,
    required BuildContext context,
  }) async {
    CommonModel model = await ApiHelper.addRewardHistory(
      coin: coin,
      price: price,
    );

    if (model.status) {
      CommonWidget.commonSnackBar(
        context: context,
        message: model.message,
        type: SnackBarType.successData,
      );
      userData!.userPoint -= int.parse(coin);
      update();
    } else {
      CommonWidget.commonSnackBar(
        context: context,
        message: model.message,
        type: SnackBarType.errorData,
      );
    }
  }
}
