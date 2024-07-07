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
  final String admobAppId;
  final Admob admob;
  final Admob adx;
  final List<RedeemReward> redeemRewards;

  Data({
    required this.splashImage,
    required this.logoImage,
    required this.isAdShow,
    required this.admobAppId,
    required this.admob,
    required this.adx,
    required this.redeemRewards,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        splashImage: json["splash_image"]?.toString() ?? "",
        logoImage: json["logo_image"]?.toString() ?? "",
        isAdShow: bool.tryParse(json["is_ad_show"]?.toString() ?? "") ?? false,
        admobAppId: json["admob_app_id"]?.toString() ?? "",
        admob: Admob.fromJson(json["admob"]),
        adx: Admob.fromJson(json["adx"]),
        redeemRewards: json["Redeem Rewards"] != null ? List<RedeemReward>.from(json["Redeem Rewards"].map((e) => RedeemReward.fromJson(e)),
              )
            : [],
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

class RedeemReward {
  final String name;
  final String image;
  final String desc;
  final List<Reward> rewards;

  RedeemReward({
    required this.name,
    required this.image,
    required this.desc,
    required this.rewards,
  });

  factory RedeemReward.fromJson(Map<String, dynamic> json) => RedeemReward(
        name: json["name"]?.toString() ?? "",
        image: json["image"]?.toString() ?? "",
        desc: json["desc"]?.toString() ?? "",
        rewards: json["rewards"] != null
            ? List<Reward>.from(json["rewards"].map((x) => Reward.fromJson(x)))
            : [],
      );
}

class Reward {
  final int coin;
  final int money;

  Reward({
    required this.coin,
    required this.money,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        coin: int.tryParse(json["coin"]?.toString() ?? "") ?? 0,
        money: int.tryParse(json["money"]?.toString() ?? "") ?? 0,
      );
}
