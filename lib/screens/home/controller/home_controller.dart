import 'package:unk/exports.dart';

class HomeController extends GetxController {
  BannerAd? bannerAdMob;
  BannerAd? bannerAdX;
  HomeModel? homeModel;
  int selectedCategory = 0;
  List<CategoryData> categoryData = [];
  bool isLoading = false;

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

  Future<void> gethomeData() async {
    isLoading = true;
    update();
    homeModel = await ApiHelper.getHomeData();
    categoryData.addAll(homeModel?.data.categoryData ?? []);
    isLoading = false;
    update();
  }

  void changeCategory({Category? category, required int index}) {
    selectedCategory = index;
    categoryData.clear();
    if (category?.id == 0) {
      categoryData.addAll(homeModel?.data.categoryData ?? []);
      update();
      return;
    }
    List<CategoryData> data = homeModel?.data.categoryData
            .where((element) => element.categoryId == category?.id)
            .toList() ??
        [];
    categoryData.addAll(data);
    update();
  }
}

class OfferModel {
  final String imagePath;
  final String title;
  final String route;

  OfferModel({
    required this.imagePath,
    required this.title,
    required this.route,
  });
}
