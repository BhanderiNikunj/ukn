class GeneralSettingModel {
  final bool status;
  final String message;
  final Data data;

  GeneralSettingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GeneralSettingModel.fromJson(Map<String, dynamic> json) =>
      GeneralSettingModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final String splashImage;
  final String logoImage;
  final bool isAdShow;
  final Admob admob;
  final Admob adx;

  Data({
    required this.splashImage,
    required this.logoImage,
    required this.isAdShow,
    required this.admob,
    required this.adx,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        splashImage: json["splash_image"]?.toString() ?? "",
        logoImage: json["logo_image"]?.toString() ?? "",
        isAdShow: bool.tryParse(json["is_ad_show"]?.toString() ?? "") ?? false,
        admob: Admob.fromJson(json["admob"]),
        adx: Admob.fromJson(json["adx"]),
      );
}

class Admob {
  final String bannerAd;
  final String nativeAd;
  final String rewardedAd;
  final String interstitialAd;
  final String appOpenAd;

  Admob({
    required this.bannerAd,
    required this.nativeAd,
    required this.rewardedAd,
    required this.interstitialAd,
    required this.appOpenAd,
  });

  factory Admob.fromJson(Map<String, dynamic> json) => Admob(
        bannerAd: json["banner_ad"]?.toString() ?? "",
        nativeAd: json["native_ad"]?.toString() ?? "",
        rewardedAd: json["rewarded_ad"]?.toString() ?? "",
        interstitialAd: json["interstitial_ad"]?.toString() ?? "",
        appOpenAd: json["app_open_ad"]?.toString() ?? "",
      );
}
