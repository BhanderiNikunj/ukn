import 'package:flutter_ukn_earning_app/exports.dart';

class RedeemController extends GetxController {
  List<RedeemReward> listOfRedeemReward = [];

  void loadRedeemData() {
    for (RedeemReward redeem in generalSettingModel?.data.redeemRewards ?? []) {
      listOfRedeemReward.add(redeem);
    }
    update();
  }
}
