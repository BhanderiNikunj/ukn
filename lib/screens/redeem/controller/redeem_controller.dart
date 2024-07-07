import 'package:unk/exports.dart';

class RedeemController extends GetxController {
  List<RedeemReward> listOfRedeemReward = [];

  void loadRedeemData() {
    for (RedeemReward redeem in generalSettingModel?.data.redeemRewards ?? []) {
      listOfRedeemReward.add(redeem);
    }
    update();
  }
}
