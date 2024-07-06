import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/utils/ads_helper.dart';

class RedeemController extends GetxController {
  BannerAd? bannerAdMob;

  Future<void> loadBannerAdMob() async {
    try {
      bannerAdMob = await AdsHelper.loadBannerAd(
        adType: AdType.admob,
        size: AdSize.largeBanner,
      );
      update();
    } catch (e) {
      debugPrint("==========$e");
    }
  }
}
