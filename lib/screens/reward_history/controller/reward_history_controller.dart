import 'package:unk/exports.dart';

class RewardHistoryController extends GetxController {
  Map<int, BannerAd> mapOfNativeAd = {};

  Future<BannerAd?> loadBannerAd({required int index}) async {
    if (mapOfNativeAd.containsKey(index)) {
      return mapOfNativeAd[index];
    }
    BannerAd? bannerAd = await AdsHelper.loadBannerAd(adType: AdType.admob);
    await bannerAd?.load();
    if (bannerAd != null) {
      mapOfNativeAd.addAll({index: bannerAd});
      return bannerAd;
    }
    return null;
  }
}
