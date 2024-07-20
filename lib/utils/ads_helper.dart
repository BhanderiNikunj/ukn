import 'package:unk/exports.dart';

class AdsHelper {
  static Future<BannerAd?> loadBannerAd({
    required AdType adType,
    AdSize? size,
  }) async {
    if (generalSettingModel?.data.isAdShow ?? false) {
      BannerAd? bannerAd;
      if (adType == AdType.admob) {
        bannerAd = BannerAd(
          size: size ?? AdSize.banner,
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
          size: size ?? AdSize.banner,
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
    return null;
  }

  static Future<void> loadInterstitialAd({required AdType adType}) async {
    if (generalSettingModel?.data.isAdShow ?? false) {
      if (adType == AdType.admob) {
        await InterstitialAd.load(
          adUnitId: generalSettingModel?.data.admob.interstitialAd ??
              "ca-app-pub-3940256099942544/1033173712",
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) async {
              debugPrint("========Interstitial Ad Load Success");
              await ad.show();
            },
            onAdFailedToLoad: (error) {
              debugPrint("=============$error");
            },
          ),
        );
      } else if (adType == AdType.adx) {
        await InterstitialAd.load(
          adUnitId: generalSettingModel?.data.adx.interstitialAd ??
              "/6499/example/interstitial",
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) async {
              debugPrint("========Interstitial Ad Load Success");
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

  static Future<void> loadRewardedAd({required AdType adType}) async {
    if (generalSettingModel?.data.isAdShow ?? false) {
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
                  debugPrint("============${reward.amount}");
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
                  debugPrint("============${reward.amount}");
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

  // static Future<NativeAd?> loadNativeAd({required AdType adType}) async {
  //   NativeAd? nativeAd;
  //   if (adType == AdType.admob) {
  //     nativeAd = NativeAd(
  //         adUnitId: 1 == 1
  //             ? "ca-app-pub-3940256099942544/2247696110"
  //             : generalSettingModel?.data.admob.nativeAd ??
  //                 "ca-app-pub-3940256099942544/2247696110",
  //         listener: NativeAdListener(
  //           onAdLoaded: (ad) {
  //             debugPrint("========Native Ad Load Success");
  //           },
  //           onAdFailedToLoad: (ad, error) {
  //             debugPrint("=============$error");
  //             ad.dispose();
  //           },
  //         ),
  //         request: const AdManagerAdRequest(),
  //         factoryId: 'adFactoryExample'
  //         // nativeTemplateStyle: NativeTemplateStyle(
  //         //   templateType: TemplateType.small,
  //         // ),
  //         );
  //   } else if (adType == AdType.adx) {
  //     nativeAd = NativeAd(
  //       adUnitId: generalSettingModel?.data.admob.nativeAd ??
  //           "ca-app-pub-3940256099942544/2247696110",
  //       listener: NativeAdListener(
  //         onAdLoaded: (ad) {
  //           debugPrint("========Native Ad Load Success");
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           debugPrint("=============$error");
  //           ad.dispose();
  //         },
  //       ),
  //       request: const AdManagerAdRequest(),
  //       nativeTemplateStyle: NativeTemplateStyle(
  //         templateType: TemplateType.medium,
  //       ),
  //     );
  //   }
  //   await nativeAd?.load();
  //   return nativeAd;
  // }
}

enum AdType { admob, adx }
