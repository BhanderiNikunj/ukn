import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/utils/ads_helper.dart';

class HomeController extends GetxController {
  BannerAd? bannerAdMob;
  BannerAd? bannerAdX;

  Future<void> loadBannerAdMob() async {
    try {
      bannerAdMob = await AdsHelper.loadBannerAd(adType: AdType.admob);
      update();
    } catch (e) {
      debugPrint("==========$e");
    }
  }

  Future<void> loadBannerAdx() async {
    try {
      bannerAdX = await AdsHelper.loadBannerAd(adType: AdType.adx);
      update();
    } catch (e) {
      debugPrint("==========$e");
    }
  }

  Future<void> loadInterstitialAdMob() async {
    try {
      await AdsHelper.loadInterstitialAd(adType: AdType.admob);
    } catch (e) {
      debugPrint("==========$e");
    }
  }

  Future<void> loadInterstitialAdx() async {
    try {
      await AdsHelper.loadInterstitialAd(adType: AdType.adx);
    } catch (e) {
      debugPrint("==========$e");
    }
  }

  Future<void> loadRewardAdMob() async {
    try {
      await AdsHelper.loadRewardedAd(adType: AdType.admob);
    } catch (e) {
      debugPrint("==========$e");
    }
  }

  Future<void> loadRewardAdx() async {
    try {
      await AdsHelper.loadRewardedAd(adType: AdType.adx);
    } catch (e) {
      debugPrint("==========$e");
    }
  }
}
