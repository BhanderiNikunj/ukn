import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unk/common/global.dart';

class AdsHelper {
  static Future<BannerAd?> loadBannerAd({required AdType adType}) async {
    BannerAd? bannerAd;
    if (adType == AdType.admob) {
      bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: generalSettingModel?.data.admob.bannerAd ??
            "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint("========Banner Ad Load Success");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            debugPrint("========$error");
          },
        ),
        request: const AdRequest(),
      );
    } else if (adType == AdType.adx) {
      bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId:
            generalSettingModel?.data.adx.bannerAd ?? "/6499/example/banner",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint("========Banner Ad Load Success");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            debugPrint("========$error");
          },
        ),
        request: const AdRequest(),
      );
    }
    await bannerAd?.load();
    return bannerAd;
  }

  static Future<void> loadInterstitialAd({required AdType adType}) async {
    if (adType == AdType.admob) {
      InterstitialAd.load(
        adUnitId: generalSettingModel?.data.admob.interstitialAd ??
            "ca-app-pub-3940256099942544/1033173712",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint("========Interstitial Ad Load Success");
            ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    } else if (adType == AdType.adx) {
      InterstitialAd.load(
        adUnitId: generalSettingModel?.data.adx.interstitialAd ??
            "/6499/example/interstitial",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint("========Interstitial Ad Load Success");
            ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    }
  }

  static Future<void> loadRewardedAd({required AdType adType}) async {
    if (adType == AdType.admob) {
      RewardedAd.load(
        adUnitId: generalSettingModel?.data.admob.rewardedAd ??
            "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint("========Rewarded Ad Load Success");
            ad.show(
              onUserEarnedReward: (ad, reward) {
                print("============${reward.amount}");
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    } else if (adType == AdType.adx) {
      RewardedAd.load(
        adUnitId: generalSettingModel?.data.adx.rewardedAd ??
            "/6499/example/rewarded",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint("========Rewarded Ad Load Success");
            ad.show(
              onUserEarnedReward: (ad, reward) {
                print("============${reward.amount}");
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    }
  }

  static Future<void> loadAppOpenAd({required AdType adType}) async {
    if (adType == AdType.admob) {
      await AppOpenAd.load(
        adUnitId: generalSettingModel?.data.admob.rewardedAd ??
            "ca-app-pub-3940256099942544/9257395921",
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) async {
            debugPrint("========App Open Ad Load Success");
            await ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    } else if (adType == AdType.adx) {
      await AppOpenAd.load(
        adUnitId: generalSettingModel?.data.adx.rewardedAd ??
            "/6499/example/app-open",
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) async {
            debugPrint("========App Open Ad Load Success");
            await ad.show();
          },
          onAdFailedToLoad: (error) {
            debugPrint("=============$error");
          },
        ),
      );
    }
  }
}

enum AdType { admob, adx }
