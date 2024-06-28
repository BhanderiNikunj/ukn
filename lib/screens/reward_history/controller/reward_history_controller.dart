import 'dart:async';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/utils/ads_helper.dart';

class RewardHistoryController extends GetxController {
  Map<int, BannerAd> mapOfNativeAd = {};

  Future<BannerAd?> loadNativeAd({required int index}) async {
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
